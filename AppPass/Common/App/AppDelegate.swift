//
//  AppDelegate.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppServices()
        showRootViewController()
        return true
    }
}

extension AppDelegate {
    private func showRootViewController() {
        
    }
}
