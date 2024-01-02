//
//  CryptoPresenter.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import Foundation

protocol CryptoViewOutput {
    func viewDidLoad()
}

final class CryptoPresenter: CryptoViewOutput {
    
    private unowned var input: CryptoViewInput
    
    init(input: CryptoViewInput) {
        self.input = input
    }
    
    func viewDidLoad() {
        input.fetchData()
        input.setupUI()
        input.setupTableView()
        input.configureConstaints()
    }
}
