//
//  SimpleAlert.swift
//  NMSwiftKit
//
//  Created by Billy Chan on 18/10/2018.
//  Copyright © 2018 Billy Chan. All rights reserved.
//

import UIKit

public struct SimpleAlert {
    public enum AlertError: Error {
        case noParentViewController
    }
    
    public static let instance = SimpleAlert()
    public var parentViewControllerFactory: (() throws -> UIViewController)?
    public var confirmActionFactory = {() -> UIAlertAction in
        return UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
    }
    
    public mutating func setDefaultParentFactory(_ factory: @escaping () -> UIViewController) {
        self.parentViewControllerFactory = factory
    }
    
    public mutating func setDefaultConfirmActionFactory(_ factory: @escaping () -> UIAlertAction ) {
        self.confirmActionFactory = factory
    }
    
    public func alert(title: String?, message: String?, parrentViewController: UIViewController? ) {
        do {
            let parentFromFactory = try self.parentViewControllerFactory?()
            guard let targetViewController = parrentViewController ?? parentFromFactory else {
                return
            }
            
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            controller.addAction(self.confirmActionFactory())
            
            targetViewController.present(targetViewController, animated: true, completion: nil)
        } catch {}
    }
}