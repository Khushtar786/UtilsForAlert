//  Utils.swift
//  Created by  on 01/06/20.
//  Copyright © 2020 . All rights reserved.


import Foundation
import UIKit

let Alert = "Alert!!!"
extension UIViewController : Threads {
    
    func ShowAlert(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        runOnMainThread {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: handler)
            alertController.addAction(action)
            // busy(on: false)
            self.present(alertController, animated: true)
        }
    }
    func AlertViewConfirm(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        runOnMainThread {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: handler)
            alertController.addAction(yesAction)
            let noAction = UIAlertAction(title: "No", style: .cancel)
            alertController.addAction(noAction)
            self.present(alertController, animated: true)
        }
    }
    func displayAlert(with title: String?, message: String?, buttons: [String], buttonStyles: [UIAlertAction.Style] = [], handler: @escaping (String) -> Void) {
        runOnMainThread {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            for i in 0 ..< buttons.count {
                let style: UIAlertAction.Style = buttonStyles.indices.contains(i) ? buttonStyles[i] : .default
                let buttonTitle = buttons[i]
                let action = UIAlertAction(title: buttonTitle, style: style) { (_) in
                    handler(buttonTitle)
                }
                alertController.addAction(action)
            }
            self.present(alertController, animated: true)
        }
    }
}

