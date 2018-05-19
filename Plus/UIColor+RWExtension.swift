//
//  UIColor+RWExtension.swift
//  RWiPlus
//
//  Created by mynSoo Wu on 2018/5/15.
//  Copyright © 2018年 mynSoo Wu. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 随机颜色
    open class var random: UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0;
            let green = CGFloat(arc4random() % 256) / 255.0;
            let blue = CGFloat(arc4random() % 256) / 255.0;
            return UIColor(red: red, green: green, blue: blue, alpha: 1);
        }
    }
    
    /// 随机颜色+随机透明
    open class var randomAlpha: UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0;
            let green = CGFloat(arc4random() % 256) / 255.0;
            let blue = CGFloat(arc4random() % 256) / 255.0;
            let alpha = CGFloat(arc4random() % 101) / 100.0;
            return UIColor(red: red, green: green, blue: blue, alpha: alpha);
        }
    }
    
    
}
