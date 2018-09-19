//
//  mainMenuViewController.swift
//  chickenNewsNetwork
//
//  Created by Ryan Teshima on 9/15/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import StitchCore
import StitchRemoteMongoDBService
import Firebase
import FirebaseStorage

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        if secondsAgo < 60 {
            return "\(secondsAgo) seconds ago"
        } else {
            return "\(secondsAgo / 60) minutes ago"
        }
    }
}

class mainMenuViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var mainPic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainPic.image = #imageLiteral(resourceName: "SadNug")
        
        let client = Stitch.defaultAppClient!
        let mongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
        let coll = mongoClient.db("mainDB").collection("chickenDays")
        coll.find().asArray({ result in
            switch result {
            case .success(let result):
                print("Found documents:")
                
                guard
                    let url: String = (try? result.first!.get("imageURL"))
                else {
                    return
                }
                self.loadImg(url: url)
                /*result.forEach({ document in
                    print(document.canonicalExtendedJSON)
                    self.loadImg(url: document.get("imageURL") as! String)
                })*/
            case .failure(let error):
                print("Error in finding documents: \(error)")
            }
        })
    }
    
    func loadImg(url: String) {
        DispatchQueue.main.async {
            let storage = Storage.storage()
            let httpsReference = storage.reference(forURL: url)
            httpsReference.getData(maxSize: 10 * 1024 * 1024) { data, error in
                if let error = error {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    let image = UIImage(data: data!)
                    self.mainPic.image = image
                }
            }
        }
    }
    
    @IBAction func TrophyButton(_ sender: Any) {
        let newVC = LeaderBoardViewController();
        self.present(newVC, animated: true, completion: nil)
    }

    @IBAction func PostPic(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let temp = AboutPhotoViewController();
            temp.img = image;
            self.present(temp, animated: true, completion: nil)
            //mainPic.image = image
        }
    }
    
    @IBAction func Settings(_ sender: Any) {
    }
    
    @IBAction func Report(_ sender: Any) {
        
    }
    
    @IBOutlet weak var timeLight: UIImageView!
    
    
    @IBOutlet weak var lastUpdated: UILabel!
    
    @IBAction func refresh(_ sender: Any) {
        let pastDate = Date(timeIntervalSinceNow: -60 * 3) //this time needs to be changed to time of photo taken
        lastUpdated.text = "Chicken last seen: \(pastDate.timeAgoDisplay())"
        let greenDate = Date(timeIntervalSinceNow: -60 * 5)
        let yellowDate = Date(timeIntervalSinceNow: -60 * 15)
        if(pastDate >= greenDate) {
            timeLight.image = #imageLiteral(resourceName: "GreenLight")
        } else if (pastDate >= yellowDate) {
            timeLight.image = #imageLiteral(resourceName: "YellowLight")
        } else {
            timeLight.image = #imageLiteral(resourceName: "RedLight")
        }
        //ADD IF STATEMENT TO SEE IF THERES A PIC ALREADY
        //mainPic.image = #imageLiteral(resourceName: "SadNug")
            
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
