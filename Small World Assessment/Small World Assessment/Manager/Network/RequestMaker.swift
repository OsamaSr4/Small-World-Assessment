//
//  RequestMaker.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public struct NetworkConfig {

    public let baseURL: String
    public let urlAppending: String
    public let queryParameters: [String: String]
    public let method: HTTPMethod
    
    public init(baseURL: String,
                urlAppending: String = "",
                queryParameters: [String: String] = [:],
                method: HTTPMethod) {
        self.baseURL = baseURL
        self.urlAppending = urlAppending
        self.queryParameters = queryParameters
        self.method = method
    }
}

struct RequestMaker {
    
    private static func resolveURL(with config: NetworkConfig) -> URL? {
        var baseURL = config.baseURL.last != "/" ? config.baseURL + "/" : config.baseURL
        baseURL = baseURL + config.urlAppending
        for (key, value) in config.queryParameters {
            baseURL = baseURL + "?" + key + "=" + value
        }
        return URL(string: baseURL)
    }
    
    public static func urlRequest(with config: NetworkConfig) -> URLRequest? {
        if let url = self.resolveURL(with: config) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = config.method.rawValue
            return urlRequest
        }
        return nil
    }
    
}
