//
//  APIRequest.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Foundation
import Alamofire

class APIRequest: API {
    var baseURL: URL
    
    var path: String
    
    var params: Parameters
    
    var method: HTTPMethod
    
    var headers: [String: String]
    
    var encoding: ParameterEncoding
    
    var isAuthenticatedEndpoint: Bool
    
    init(
        _ path: String,
        method: HTTPMethod = .get,
        parameters: Parameters = [:],
        encoding: ParameterEncoding = URLEncoding.default,
        headers: [String: String] = [:],
        isAuthenticatedEndpoint: Bool = true
    ) {
        self.baseURL = URL(string: K.API.URL.BaseUrl)!
        self.path = path
        self.params = parameters
        self.method = method
        self.headers = headers
        self.encoding = encoding
        self.isAuthenticatedEndpoint = isAuthenticatedEndpoint
    }
}
