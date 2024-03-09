//
//  ApiCalls.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

protocol APICallsProtocol {}

//MARK: For Getting Movies List
protocol GetMoviesListApiProtocol : APICallsProtocol {
    func getMovies(page:Int,completion: @escaping (Result<MovieListResponse, BaseError>) -> Void)
}

//MARK: API CAller with initilizer for Network Manager
class APICalls {
    private var network: NetworkProtocol
    init(networkProtocol: NetworkProtocol = NetworkManager()) {
        self.network = networkProtocol
    }
}

//MARK: Getting Movies List
extension APICalls: GetMoviesListApiProtocol {
    
    func getMovies(page : Int , completion: @escaping (Result<MovieListResponse, BaseError>) -> Void) {
        let config = NetworkConfig(baseURL: Constants.API.baseURL.rawValue,
                                             urlAppending: Constants.API.EndPoints.discoverMovies.rawValue,
                                             queryParameters: makeListQueryParam(page: page),
                                             method: .get)
        print("getMovies",config)
        guard let urlRequest = RequestMaker.urlRequest(with: config) else {
            completion(.failure(BaseError(message: Constants.NetworkCallError.wentWrong.rawValue)))
            return
        }
        network.executeAPI(withURLRequest: urlRequest, completion: completion)
    }
    private func makeListQueryParam(page:Int) -> [String: String] {
        return [Constants.API.QueryParam.apiKeyParam.rawValue: Constants.API.key.rawValue]
    }
}


//MARK: For Getting Details of the Movie
protocol GetMovieDetailsApiProtocol: APICallsProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetails, BaseError>) -> Void)
}
extension GetMovieDetailsApiProtocol {
    fileprivate func makeURLString(withId id: Int) -> String {
        return "\(Constants.API.EndPoints.details.rawValue)\(id)"
    }
}

extension APICalls : GetMovieDetailsApiProtocol {
    func getMovieDetails(withId id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        let config = NetworkConfig(baseURL: Constants.API.baseURL.rawValue,
                                             urlAppending: makeURLString(withId: id),
                                             queryParameters: makeQueryParam(),
                                             method: .get)
        
        guard let urlRequest = RequestMaker.urlRequest(with: config) else {
            completion(.failure(BaseError(message: Constants.NetworkCallError.wentWrong.rawValue)))
            return
        }
        network.executeAPI(withURLRequest: urlRequest, completion: completion)
    }
    
    private func makeQueryParam() -> [String: String] {
        return [Constants.API.QueryParam.apiKeyParam.rawValue: Constants.API.key.rawValue]
    }
    
}



