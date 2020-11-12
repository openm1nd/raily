//
//  Utils.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 Apps BG. All rights reserved.
//

import Foundation
import UIKit

struct Utils {
    
    static func classByIdentifier(_ storyboard : String, identifier : String) -> UIViewController {
        return UIStoryboard.init(name: storyboard, bundle: Bundle.main).instantiateViewController(withIdentifier: identifier)
    }
	
    static func entryClassByStoryboard(_ storyboard : String) -> UIViewController {
        return UIStoryboard.init(name: storyboard, bundle: Bundle.main).instantiateInitialViewController()!
	}
	
	static func animateTransition(with block: @escaping ()->Void) {
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
			UIView.transition(with: UIWindow.key!, duration: 0.3, options: .transitionCrossDissolve, animations: {
				block()
			})
		})
	}
	
	static func popupErrorMessage(_ message: String, from: UIViewController) {
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (_) in
            }))
            from.present(alert, animated: true, completion: nil)
        }
    }
    
	static func disableUserInteraction() {
		UIView.animate(withDuration: 0.2) {
			UIWindow.key!.alpha = 0.6
			UIWindow.key!.isUserInteractionEnabled = false
		}
		
    }
	 
    static func enableUserInteraction() {
		UIView.animate(withDuration: 0.2) {
			UIWindow.key!.alpha = 1
			UIWindow.key!.isUserInteractionEnabled = true
		}
    }
}
