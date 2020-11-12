//
//  RootNavigationController.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright (c) 2020 AppsBG. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
    }
    
	fileprivate func reloadColors() {
		navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
		navigationBar.tintColor = .white
		navigationBar.barTintColor = Constants.Colors.primaryColor
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		reloadColors()
	}
	
}
