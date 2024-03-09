//
//  NetworkManager.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

protocol NetworkProtocol {
    func executeAPI<T: Decodable>(withURLRequest request: URLRequest, completion: @escaping (Result<T, BaseError>) -> Void)
}

class NetworkManager : NetworkProtocol {

    private var session: URLSession
    private var apiTask: URLSessionDataTask?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    func executeAPI<T>(withURLRequest request: URLRequest, completion: @escaping (Result<T, BaseError>) -> Void) where T : Decodable {
        print("getMovies",request)
        self.apiTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(BaseError(message: Constants.NetworkCallError.wentWrong.rawValue)))
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(BaseError(message: Constants.NetworkCallError.wentWrong.rawValue)))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(BaseError(message: Constants.NetworkCallError.parsingError.rawValue)))
            }
            
        }
        apiTask?.resume()
    }
    
}
