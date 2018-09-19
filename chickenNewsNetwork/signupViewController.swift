//
//  signupViewController.swift
//  chickenNewsNetwork
//
//  Created by Evan Mays on 9/15/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class signupViewController: UIViewController {

    @IBAction func jhuPressed(_ sender: UIButton) {
        let newVC = NotificationSettingsViewController();
        self.present(newVC, animated: true, completion: nil)
        //self.window.rootViewController = newVC
        //self.navigationController?.pushViewController(newVC, animated: true);
    }
    @IBAction func nyuPressed(_ sender: UIButton) {
        let newVC = NotificationSettingsViewController();
        self.present(newVC, animated: true, completion: nil)
        //self.window.rootViewController = newVC
        //self.navigationController?.pushViewController(newVC, animated: true);
    }
    @IBAction func stanfPressed(_ sender: UIButton) {
        let newVC = NotificationSettingsViewController();
        self.present(newVC, animated: true, completion: nil)
        //self.window.rootViewController = newVC
        //self.navigationController?.pushViewController(newVC, animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
