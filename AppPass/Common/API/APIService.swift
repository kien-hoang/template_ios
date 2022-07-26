//
//  APIService.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import SwiftyJSON

class APIService {
    static let shared = APIService()
    
    private let maxRetry = 3
    private let unauthorizeStatusCode = 401
    private let internalServerErrorStatusCode = 500
}

extension APIService {
    /*
    func request<A: API>(api: A, retryCount: Int = 0) -> Observable<(HTTPURLResponse, Data)> {
        let headers = api.headers.map { key, value in Alamofire.HTTPHeader(name: key, value: value) }
        return RxAlamofire
            .requestData(api.method, api.url, parameters: api.params, encoding: api.encoding, headers: HTTPHeaders(headers), interceptor: nil)
            .observe(on: SerialDispatchQueueScheduler(qos: .background))
            .flatMap(weak: self, selector: { s, response in
                s.refreshTokenIfNeeded(response: response, api: api, retryCount: retryCount)
            })
    }
     */
    
    func requestJSON<A: API>(api: A, retryCount: Int = 0) -> Observable<(APIError?, JSON)> {
        let headers = api.headers.map { key, value in Alamofire.HTTPHeader(name: key, value: value) }
        return RxAlamofire
            .requestJSON(api.method, api.url, parameters: api.params, encoding: api.encoding, headers: HTTPHeaders(headers), interceptor: nil)
            .observe(on: SerialDispatchQueueScheduler(qos: .background))
            .withUnretained(self)
            .flatMapLatest { s, r -> Observable<(APIError?, JSON)> in
                let (response, object) = r
                let json = JSON(object)
                let error = s.handleError(response: response, json: json)
                #if DEBUG
                s.log(api: api, response: response, json: json)
                #endif
                return Observable.just((error, json))
            }
    }
    
    private func handleError(response: HTTPURLResponse, json: JSON) -> APIError? {
        switch response.statusCode {
        case unauthorizeStatusCode:
            return .unauthorized
            
        case internalServerErrorStatusCode:
            return .internalServerError
            
        case 200...299:
            return nil
            
        default:
            let error = json["error"].stringValue
            return .custom(message: error)
        }
    }

    /*
    func refreshTokenIfNeeded<A: API>(response: (HTTPURLResponse, Data), api: A, retryCount: Int = 0) -> Observable<(HTTPURLResponse, Data)> {
        guard retryCount < self.maxRetry else { return Observable.just(response) }
        let (urlResponse, _) = response
        if urlResponse.statusCode == self.unauthorizeStatusCode && api.isAuthenticatedEndpoint {
            return AppManagers.shared.user.refreshTokenAuth0()
                .asObservable()
                .flatMap(weak: self) { s, _ -> Observable<(HTTPURLResponse, Data)> in
                    s.request(api: api, retryCount: retryCount + 1)
                }
        } else {
            return Observable.just(response)
        }
    }
     */
}

private extension APIService {
    private func log(api: API, response: HTTPURLResponse, json: JSON) {
        print("/*--------------\nNSLog API")
        self.logAPI(api: api)
        print("Status code: \(response.statusCode)")
        print("Json:\n\(json)")
        print("--------------*/")
    }
    private func logError(api: API, response: HTTPURLResponse, data: Data) {
        print("/*--------------\nNSLog ERROR")
        self.logAPI(api: api)
        print("Status code:\(response.statusCode)")
        do {
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print("Json:\n\(json)")
            }
        }
        print("--------------*/")
    }
    private func logIssue(api: API, response: HTTPURLResponse, data: Data) {
        print("/*--------------\nNSLog Issue")
        self.logAPI(api: api)
        do {
            if let json = String(data: data, encoding: String.Encoding.ascii) {
                print("Result Json:\n\(json)")
//                print("Json: Exist")
            }
        }
        print("--------------*/")
    }
    private func logIssueCompletable(api: API, response: HTTPURLResponse, data: Data) {
        print("/*--------------\nNSLog Issue Completable")
        self.logAPI(api: api)
        print("--------------*/")
    }
    func logAPI(api: API) {
        print("BaseUrl: \(api.baseURL.absoluteString)")
        print("Path: \(api.path)")
        let headers = api.headers
        if headers["Authorization"] != nil {
             
        } else {
//            if api.isAuthenticatedEndpoint, let credentials = self.credentials{
//                headers["Authorization"] = "Bearer \(credentials.accessToken)"
//            }
        }
        print("Headers: \(headers)")
        if let theJSONData = try?  JSONSerialization.data(withJSONObject: api.params, options: .prettyPrinted), let theJSONText = String(data: theJSONData, encoding: String.Encoding.ascii) {
            print("Params JSON \n\(theJSONText)")
        }
//        print("Params: \(api.params)")
        print("Method: \(api.method)")
    }
}
