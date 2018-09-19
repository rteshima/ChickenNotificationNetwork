//
//  AboutPhotoViewController.swift
//  chickenNewsNetwork
//
//  Created by Evan Mays on 9/15/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import StitchCore
import StitchRemoteMongoDBService
import Firebase
import FirebaseStorage

class AboutPhotoViewController: UIViewController {

    var img: UIImage!
    
    @IBAction func Continue(_ sender: Any) {
        let newVC = mainMenuViewController();
        self.present(newVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a root reference
        let storage = Storage.storage()
        
        // Create a reference to "mountains.jpg"
        let ref = storage.reference().child("images/today")
        
        let uploadTask = ref.putData(UIImagePNGRepresentation(img)!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("BIG ERROR")
                print(error)
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            ref.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("ERROR")
                     print(error)
                    return
                }
                self.insertTOMONGO(url: downloadURL.absoluteString)
            }
        
        }
    }
    
    //@IBOutlet weak var preview: UIImageView!
    
    
    func insertTOMONGO(url: String) {
        //runs once image is uploaded to firebase
        let client = Stitch.defaultAppClient!
        let mongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
        let coll = mongoClient.db("mainDB").collection("chickenDays")
        coll.insertOne(["time": 0,
                        "location": "Nolan's",
                        "imageURL": url,
                        ]
        ) { result in
            switch result {
            case .success:
                print("Yo")
            case .failure(let error):
                print("Error updating or inserting a document: \(error)")
            }
        }
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
