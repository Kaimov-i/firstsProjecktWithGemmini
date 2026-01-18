//
//  extention+UIColor.swift
//  lesson_1
//
//  Created by Ильман on 17.01.2026.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
