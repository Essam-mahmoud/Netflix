//
//  AppConstant.swift
//
//  Created by Essam Orabi on 19/09/2021.
//

import Foundation

class AppConstant: NSObject {

    static let API_KEY = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let  apiDomain = "https://api.themoviedb.org"
    static public var getMovies : String {
        return "\(apiDomain)/3/discover/movie"
    }
    static public var movieDetails : String {
        return "\(apiDomain)/3/movie/"
    }
}

enum statusCode {

    static let NOT_FOUND = 404
    static let OK = 200
    static let BAD_GATEWAY = 502
    static let SERVICE_UNAVAILABLE = 500
    static let NO_CONTENT = 204
    static let ACCEPTED = 201
    static let CREATED = 0
    static let UNAuthoried = 401


}

public enum State {
    case loading
    case showAlert
    case error
    case empty
    case populated
    case normal
    case refresh
}
