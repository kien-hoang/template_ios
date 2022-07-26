//
//  BaseScrollView.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import UIKit

class BaseScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentInsetAdjustmentBehavior = .never
    }
}
