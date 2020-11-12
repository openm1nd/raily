//
//  SplashViewController.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

// This view controller is used if you need to preload data (ofcourse it should be done outside of it, this is just a dummy example)
class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.openMainScreen()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
