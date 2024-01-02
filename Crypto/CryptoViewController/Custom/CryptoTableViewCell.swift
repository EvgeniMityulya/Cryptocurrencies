//
//  CryptoTableViewCell.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let overlayView = UIView()
    private let stackView = UIStackView()
    private let cryptoName = UILabel()
    private let cryptoCurrency = UILabel()
    
    // MARK: - Lifecycle Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(coin: Coin) {
        cryptoName.text = coin.name
        
        if let priceUSD = coin.priceUSD {
            let formattedValue = String(format: "%.3f", priceUSD)
            cryptoCurrency.text = "$\(formattedValue)"
        } else {
            cryptoCurrency.text = "Error"
        }
    }
    
    private func configureStackView() {
        self.backgroundColor = .clear
        overlayView.backgroundColor = .cellColor
        overlayView.layer.cornerRadius = 10
        
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        cryptoName.numberOfLines = 0
        cryptoCurrency.numberOfLines = 0
        
        cryptoName.textColor = .white
        cryptoName.font = .systemFont(ofSize: 18, weight: .bold)
        cryptoCurrency.textColor = .lightText
        cryptoCurrency.textAlignment = .right
    }
    
    private func configureUI() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        cryptoName.translatesAutoresizingMaskIntoConstraints = false
        cryptoCurrency.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(overlayView)
        
        overlayView.addSubview(stackView)
        
        stackView.addArrangedSubview(cryptoName)
        stackView.addArrangedSubview(cryptoCurrency)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
            
            stackView.topAnchor.constraint(equalTo: overlayView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor),
            
        ])
    }
}
