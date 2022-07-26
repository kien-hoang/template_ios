//
//  HomeAPIManager.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Foundation
import RxSwift
import Alamofire

class HomeAPIManager {
    static let shared = HomeAPIManager()
    private let bag = DisposeBag()
    
    /* Example API */
    func getCoinMarkets(query: [String: Any]) -> Single<[CoinMarket]> {
        let request = HomeAPIRequest.shared.coinMarketsRequest(query: query)
        return APIService.shared.requestJSON(api: request)
            .map { error, json -> [CoinMarket] in
                guard error == nil else { throw error! }
                
                let coinMarkets = json.arrayValue.map { CoinMarket(json: $0) }
                return coinMarkets
            }.asSingle()
    }
}
