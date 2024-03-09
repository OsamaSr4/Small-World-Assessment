//
//  BaseError.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

//MARK: Common Error
struct BaseError {
    let message: String

    init(message: String) {
        self.message = message
    }
}

extension BaseError: LocalizedError {
    var errorDescription: String? { return message }
}
