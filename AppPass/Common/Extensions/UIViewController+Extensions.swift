//
//  UIViewController+Extensions.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import UIKit

extension UIViewController {
    /// - Parameters:
    ///   - name: notification name.
    ///   - selector: selector to run with notified.
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }

    /// - Parameter name: notification name.
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }

    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

/// Check ViewController Push or Present
extension UIViewController {
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            return true
        } else if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        } else {
            return false
        }
    }
}

extension UIViewController {
    static var segueIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    static var topViewController: UIViewController? {
        return topViewController()
    }

    static func topViewController(of viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController ) -> UIViewController? {
        if let viewController = viewController as? UIPageViewController {
            return topViewController(of: viewController.viewControllers?.first)
        }

        if let viewController = viewController as? UINavigationController {
            return topViewController(of: viewController.visibleViewController)
        }

        if let viewController = viewController as? UITabBarController {
            if let viewController = viewController.selectedViewController {
                return topViewController(of: viewController)
            }
        }

        if let viewController = viewController?.presentedViewController {
            return topViewController(of: viewController)
        }

        return viewController
    }
}

extension UIViewController {
    static func fromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
