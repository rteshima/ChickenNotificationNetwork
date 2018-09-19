//
//  NotificationSettingsViewController.swift
//  chickenNewsNetwork
//
//  Created by Sungho Yoo on 9/15/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit
import StitchCore
import StitchRemoteMongoDBService

class NotificationSettingsViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var TextNotification: UISwitch!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var PhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.layer.cornerRadius = 20;
        PhoneNumber.isUserInteractionEnabled = false;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (TextNotification.isOn && PhoneNumber.text != "") {
            let client = Stitch.defaultAppClient!
            let mongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
            let coll = mongoClient.db("mainDB").collection("devices")
            coll.insertOne(["number": PhoneNumber.text]) { result in
                switch result {
                case .success:
                    print("yo")
                    /*coll.find().asArray({ result in
                        switch result {
                        case .success(let result):
                            print("Found documents:")
                            
                            result.forEach({ document in
                                print(document.canonicalExtendedJSON)
                            })
                        case .failure(let error):
                            print("Error in finding documents: \(error)")
                        }
                    })*/
                    
                case .failure(let error):
                    print("Error updating or inserting a document: \(error)")
                }
            }/*
            coll.updateOne(
                filter: ["owner_id": "fes"],
                update: ["number": 42],
                options: RemoteUpdateOptions(upsert: true)
            ) { result in
                switch result {
                case .success:
                    coll.find().asArray({ result in
                        switch result {
                        case .success(let result):
                            print("Found documents:")
                            
                            result.forEach({ document in
                                print(document.canonicalExtendedJSON)
                            })
                        case .failure(let error):
                            print("Error in finding documents: \(error)")
                        }
                    })
                    
                case .failure(let error):
                    print("Error updating or inserting a document: \(error)")
                }
            }*/
        }
        let vc = mainMenuViewController();
        self.present(vc, animated:false, completion:nil);
    }
    
    @IBAction func TextNotificationCheck(_ sender: UISwitch) {
        if (sender.isOn) {
            PhoneNumber.isUserInteractionEnabled = true;
        }
        else {
            PhoneNumber.isUserInteractionEnabled = false;
        }
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
