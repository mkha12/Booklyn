//
//  UIColor+Extentions.swift
//  Booklyn
//
//  Created by MARIIA on 29.04.24.
//

import UIKit

extension UIColor {
    static var brown: UIColor { UIColor(named: "color.auth.button") ?? UIColor.black }
    static var light_brown: UIColor { UIColor(named: "light_brown") ?? UIColor.brown }
    static var ypRed: UIColor { UIColor(named: "red") ?? UIColor.red }
    static var ypDarkGray: UIColor { UIColor(named: "backrground") ?? UIColor.darkGray }
    static var ypGray: UIColor { UIColor(named: "gray") ?? UIColor.gray }
    static var ypWhite: UIColor { UIColor(named: "white") ?? UIColor.white }
}