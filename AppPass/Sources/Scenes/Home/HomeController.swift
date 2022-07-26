//
//  ViewController.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query: [String: Any] = [
            "vs_currency": "usd",
            "order": "market_cap_desc",
            "per_page": 100,
            "page": 1,
            "sparkline": false,
            "price_change_percentage": "24h"
        ]
        HomeAPIManager.shared.getCoinMarkets(query: query)
            .subscribe { coins in
                
            } onFailure: { error in
                
            } onDisposed: {
            }
            .disposed(by: bag)
    }
}
