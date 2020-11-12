//
//  UIViewController+Loading.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

extension UIViewController {
    func startLoadingIndicator(color: UIActivityIndicatorView.Style? = nil) {
        DispatchQueue.main.async { [weak self] in
            let activityIndicatorView = UIActivityIndicatorView(style: .large)
            activityIndicatorView.tintColor = .systemBlue
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.startAnimating()
            activityIndicatorView.tag = 999
            self?.view.addSubview(activityIndicatorView)
            self?.view.bringSubviewToFront(activityIndicatorView)
            let horizontalConstraint = NSLayoutConstraint(item: activityIndicatorView,
                                                          attribute: .centerX,
                                                          relatedBy: .equal,
                                                          toItem: self?.view,
                                                          attribute: .centerX,
                                                          multiplier: 1,
                                                          constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: activityIndicatorView,
                                                        attribute: .centerY,
                                                        relatedBy: .equal,
                                                        toItem: self?.view,
                                                        attribute: .centerY,
                                                        multiplier: 1,
                                                        constant: 0)
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        }
    }
    
    func stopLoadingIndicator() {
        for v in view.subviews.filter({$0.tag == 999}) where v is UIActivityIndicatorView {
            DispatchQueue.main.async {
                v.removeFromSuperview()
            }
        }
    }
}
