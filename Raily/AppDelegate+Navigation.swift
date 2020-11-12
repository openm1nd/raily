//
//  AppDelegate+Navigation.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

extension AppDelegate {
	static func openMainScreen() {
        let vc = Utils.entryClassByStoryboard("Stations")
        Utils.animateTransition {
            UIWindow.key!.rootViewController = vc
        }
    }
}
