//
//  CryptoViewController.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import UIKit

protocol CryptoViewInput: AnyObject {
    func setupTableView()
    func setupUI()
}

final class CryptoViewController: UIViewController {
    
    var output: CryptoViewOutput?

    private let cryptoTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

extension CryptoViewController: CryptoViewInput {
    func setupTableView() {
//        cryptoTableView.dataSource = self
//        cryptoTableView.delegate = self
        cryptoTableView.showsVerticalScrollIndicator = false
        cryptoTableView.backgroundColor = .clear
        cryptoTableView.separatorStyle = .none
//        cryptoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoCell")
    }
    
    func setupUI() {
        view.backgroundColor = .red
    }
}

//extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
