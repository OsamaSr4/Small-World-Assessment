//
//  Helper Protocols.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import UIKit

protocol IdentifiableProtocol {
    static func getIdentifier() -> String
}

extension IdentifiableProtocol {
    static var name: String {
        return String(describing: self)
    }

    static func getIdentifier() -> String {
        return self.name
    }
}

public protocol Alertable {}
public extension Alertable where Self: UIViewController {
    
    func showAlert(title: String = "",
                   message: String,
                   completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: completion)
        }
    }
}
