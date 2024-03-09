//
//  Coordinator.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
