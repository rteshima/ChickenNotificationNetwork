//
//  LeaderBoardViewController.swift
//  chickenNewsNetwork
//
//  Created by Sungho Yoo on 9/15/18.
//  Copyright © 2018 Evan Mays. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController {

    
    @IBOutlet weak var View1: UIImageView!
    @IBOutlet weak var View2: UIImageView!
    @IBOutlet weak var View3: UIImageView!
    @IBOutlet weak var View4: UIImageView!
    @IBOutlet weak var View5: UIImageView!
    @IBOutlet weak var View6: UIImageView!
    @IBOutlet weak var View7: UIImageView!
    @IBOutlet weak var View8: UIImageView!
    @IBOutlet weak var View9: UIImageView!
    @IBOutlet weak var View10: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        View1.layer.cornerRadius = 15;
        View1.clipsToBounds = true;
        View2.layer.cornerRadius = 15;
        View2.clipsToBounds = true;
        View3.layer.cornerRadius = 15;
        View3.clipsToBounds = true;
        View4.layer.cornerRadius = 15;
        View4.clipsToBounds = true;
        View5.layer.cornerRadius = 15;
        View5.clipsToBounds = true;
        View6.layer.cornerRadius = 15;
        View6.clipsToBounds = true;
        View7.layer.cornerRadius = 15;
        View7.clipsToBounds = true;
        View8.layer.cornerRadius = 15;
        View8.clipsToBounds = true;
        View9.layer.cornerRadius = 15;
        View9.clipsToBounds = true;
        View10.layer.cornerRadius = 15;
        View10.clipsToBounds = true;

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func done(_ sender: Any) {
        let newVC = mainMenuViewController();
        self.present(newVC, animated: true, completion: nil)
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
