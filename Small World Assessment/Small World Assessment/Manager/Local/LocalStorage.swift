//
//  LocalStorage.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
class LocalStorage {
    
    static let instance = {
        let instance = LocalStorage()
        return instance
    }()
    
    //MARK: - Movie List
    func saveMoviesListResponse(_ data: MovieListResponse){
        deleteMoviesListResponse()
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            print("Saved Movie List Response")
            UserDefaults.standard.set(encodedData, forKey: "MovieListResponse")
        } catch {
            fatalError("Can't save Movie List Response")
        }
    }
   
    func getMoviesListResponse()-> MovieListResponse?{
        if UserDefaults.standard.object(forKey: "MovieListResponse") != nil {
            if let data = UserDefaults.standard.value(forKey: "MovieListResponse") as? Data {
                let decoder = JSONDecoder()
                let data = try? decoder.decode(MovieListResponse.self, from: data)
                return data!
            }
        }
        return nil
    }
    
    func deleteMoviesListResponse(){
        UserDefaults.standard.set(nil, forKey: "MovieListResponse")
    }
    
}
