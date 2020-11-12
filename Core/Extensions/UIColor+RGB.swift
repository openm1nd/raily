//
//  UIColor+RGB.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright (c) 2020 AppsBG. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    static func rgba(_ r: Int, _ g: Int, _ b: Int, _ a: Int) -> UIColor {
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
}
