//
//  CryptoBuilder.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import Foundation

enum CryptoBuilder {
    static func setupModule() -> CryptoViewController {
        let viewController = CryptoViewController()
        viewController.output = CryptoPresenter(input: viewController)
        return viewController
    }
}
