//
//  Reachability+NetworkAvailable.swift
//  AppPass
//
//  Created by Bradley Hoang on 18/07/2022.
//

import Reachability

extension Reachability {
    var isNetworkAvailable: Bool {
        return (connection == .wifi) || (connection == .cellular)
    }
}
