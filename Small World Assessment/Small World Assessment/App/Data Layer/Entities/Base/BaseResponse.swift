//
//  BaseResponse.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

protocol BaseResponse {
    
    var code: Int? { get set }
    var message: String? { get set }
    var succes: Bool? { get set }
    
}
