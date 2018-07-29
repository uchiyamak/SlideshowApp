//
//  showImg.swift
//  SlideshowApp
//
//  Created by 内山和也 on 2018/07/29.
//  Copyright © 2018年 kazuya.uchiyama. All rights reserved.
//

import UIKit

class showImg: UIViewController {

    @IBOutlet weak var ViewImg: UIImageView!
    var imgName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewImg.image = UIImage(named: imgName)

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
