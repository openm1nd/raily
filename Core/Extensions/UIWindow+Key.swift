//
//  UIWindow+Key.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
