//
//  HomeAPIRequest.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Foundation
import Alamofire

class HomeAPIRequest {
    
    static let shared = HomeAPIRequest()
    
    func coinMarketsRequest(query: [String: Any]) -> APIRequest {
        let request = APIRequest("coins/markets")
        request.params = query
        request.encoding = URLEncoding(destination: .queryString)
        
        return request
    }
}
