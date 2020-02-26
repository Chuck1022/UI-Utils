//
//  UIViewController+Visible.swift
//  Pods-UI-Utils_Example
//
//  Created by XUN WANG on 26/02/20.
//

import UIKit

extension UIViewController {
    
    class var visibleVC: UIViewController? {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        return topVC(for: rootVC)
    }
    
    class func topVC(for vc: UIViewController?) -> UIViewController? {
        guard let vc = vc else { return nil }
        switch vc {
        case is UITabBarController:
            return topVC(for: (vc as? UITabBarController)?.selectedViewController)
        case is UINavigationController:
            return (vc as? UINavigationController)?.visibleViewController
        default:
            if let presentedViewController = vc.presentedViewController {
                return topVC(for: presentedViewController)
            } else {
                return vc
            }
        }
    }
    
    
}
