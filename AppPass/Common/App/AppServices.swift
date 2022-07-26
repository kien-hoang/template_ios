//
//  AppServices.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import IQKeyboardManagerSwift
import Toaster
#if DEBUG
import CocoaDebug
#endif

extension AppDelegate {
    func setupAppServices() {
        setupIQKeyboard()
        setupToastView()
        
        #if DEBUG
        setupCocoaDebug()
        #endif
    }
}

// MARK: - IQKeyboard

extension AppDelegate {
    private func setupIQKeyboard() {
        IQKeyboardManager.shared.enable = true
    }
}

// MARK: - Toaster

extension AppDelegate {
    private func setupToastView() {
        ToastView.appearance().textInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        ToastView.appearance().bottomOffsetPortrait = 40
        ToastView.appearance().backgroundColor = UIColor.black
        ToastView.appearance().textColor = UIColor.white
        ToastView.appearance().shadowColor = UIColor.black
        ToastView.appearance().shadowOffset = CGSize(width: 2, height: 4)
        ToastView.appearance().shadowOpacity = 0.15
        ToastView.appearance().shadowRadius = 2
        ToastView.appearance().useSafeAreaForBottomOffset = true
    }
}

// MARK: - CocoaDebug

extension AppDelegate {
    private func setupCocoaDebug() {
        CocoaDebugSettings.shared.enableLogMonitoring = true
    }
}
