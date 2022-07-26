//
//  API.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Foundation
import Alamofire

protocol API {
    var baseURL: URL { get }
    var path: String { get }
    var params: Parameters { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: [String: String] { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var isAuthenticatedEndpoint: Bool { get }
}

extension API {
    var url: URL {
        self.baseURL.appendingPathComponent(self.path)
    }
}
