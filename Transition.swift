//
//  Transition.swift
//  Pods-UI-Utils_Example
//
//  Created by XUN WANG on 27/02/20.
//

import UIKit

enum TransitionType: Int {
    
    case push, present
    
}

final class Transition {

    class func show(vc: UIViewController, transitionType: TransitionType = .push, animated: Bool = true) {
        guard let visibleVC = UIViewController.visibleVC else { return }
        switch transitionType {
        case .push:
            if let naviVC = visibleVC.navigationController {
                naviVC.pushViewController(vc, animated: animated)
            } else {
                show(vc: vc, transitionType: .present, animated: animated)
            }
        case .present:
            let naviVC = UINavigationController(rootViewController: vc)
            naviVC.modalPresentationStyle = .overFullScreen
            visibleVC.present(naviVC, animated: animated, completion: nil)
        }
    }
    
}
