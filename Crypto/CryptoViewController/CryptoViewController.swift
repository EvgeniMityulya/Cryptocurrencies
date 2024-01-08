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
    func configureConstaints()
    func fetchData()
}

final class CryptoViewController: UIViewController {
    
    var output: CryptoViewOutput?
    var coins: [Coin] = []

    private let mainLabel = UILabel()
    private let cryptoTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

extension CryptoViewController: CryptoViewInput {
    func setupTableView() {
        cryptoTableView.dataSource = self
        cryptoTableView.delegate = self
        cryptoTableView.showsVerticalScrollIndicator = false
        cryptoTableView.backgroundColor = .clear
        cryptoTableView.separatorStyle = .none
        cryptoTableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "CryptoCell")
    }
    
    func setupUI() {
        view.backgroundColor = .bgColor
        
        mainLabel.text = "Exchange Rates"
        mainLabel.textColor = .white
        mainLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func configureConstaints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainLabel)
        view.addSubview(cryptoTableView)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cryptoTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    func fetchData() {
        cryptoTableView.reloadData()
        NetworkManager.instance.getAssets { coins in
            self.coins = coins
            DispatchQueue.main.async {
                self.cryptoTableView.reloadData()
            }
        }
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as? CryptoTableViewCell else { return UITableViewCell() }
        let coin = coins[indexPath.row]
        
        cell.selectionStyle = .none
        cell.configure(coin: coin)
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        83
    }
}
