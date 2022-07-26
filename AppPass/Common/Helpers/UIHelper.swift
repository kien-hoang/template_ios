//
//  UIHelper.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Toaster
import SVProgressHUD

class UIHelper {

    static func showError(_ error: String?) {
        guard let error = error else {
            return
        }
        func show() {
            UIHelper.showToast(error)
        }

        if Thread.isMainThread {
            show()
        } else {
            DispatchQueue.main.async {
                show()
            }
        }
    }

    static func showLoading() {
        func show() {
            SVProgressHUD.show()
        }

        if Thread.isMainThread {
            show()
        } else {
            DispatchQueue.main.async {
                show()
            }
        }
    }

    static func hideLoading() {
        func hide() {
            SVProgressHUD.dismiss()
        }

        if Thread.isMainThread {
            hide()
        } else {
            DispatchQueue.main.async {
                hide()
            }
        }
    }

    static func showToast(_ message: String?) {
        guard let message = message else {return}
        ToastCenter.default.cancelAll()
        Toast(text: message, delay: 0, duration: 2).show()
    }
}
