//
//  APIError.swift
//  AppPass
//
//  Created by Bradley Hoang on 19/07/2022.
//

import Foundation

enum APIError: Error {
    case unknown
    case unauthorized
    case networkError
    case internalServerError
    case invalidJSON
    case custom(message: String)
}
