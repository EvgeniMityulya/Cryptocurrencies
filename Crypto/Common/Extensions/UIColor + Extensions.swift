//
//  UIColor + Extensions.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import Foundation

import UIKit.UIColor

extension UIColor {
    static var bgColor: UIColor {
        return UIColor(named: "backgroundVC") ?? .black
    }
    
    static var cellColor: UIColor {
        return UIColor(named: "tableViewCell") ?? .black
    }
}
