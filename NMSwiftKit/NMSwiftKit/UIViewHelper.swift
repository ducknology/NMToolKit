//
//  UIViewHelper.swift
//  NMSwiftKit
//
//  Created by Billy Chan on 19/10/2018.
//  Copyright © 2018 Billy Chan. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func addSubviewAndExpand(_ subview: UIView) -> [NSLayoutConstraint] {
        self.addSubview(subview)
        
        return subview.expandToMatchSuperview()
    }
    
    @discardableResult func expandToMatchSuperview() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        guard let superview = self.superview else {
            return constraints
        }
        
        constraints.append(self.leftAnchor.constraint(equalTo: superview.leftAnchor))
        constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor))
        constraints.append(self.rightAnchor.constraint(equalTo: superview.rightAnchor))
        constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor))
        
        self.superview?.addConstraints(constraints)
        
        return constraints
    }
}