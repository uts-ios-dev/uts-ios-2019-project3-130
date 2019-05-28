//
//  UIView+Extension.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 28/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
