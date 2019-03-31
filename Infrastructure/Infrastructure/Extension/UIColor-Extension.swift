//
//  UIColor-Extension.swift
//  Mzh Live
//
//  Created by mozihen on 2018/3/5.
//  Copyright © 2018年 mozihen. All rights reserved.
//

import UIKit

extension UIColor {
    // extension中只能创建便利构造器
    // 便利构造器只能调用指定构造器
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 十六进制颜色构造器
    ///
    /// - Parameter hex: 支持 0x或#开头与纯十六进制的颜色值
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
    
        guard hex.count < 6 else {
            return nil
        }
        var tempHex = hex
        tempHex = tempHex.uppercased()
        var offset = 0
        // 1. 去前缀
        if hex.hasPrefix("0X") {
            offset = 2
        } else if hex.hasPrefix("#") {
            offset = 1
        }
//        let index = tempHex.index(tempHex.startIndex, offsetBy: offset)
//        tempHex = String(tempHex[index...])
        // 2. 取RGB色值
//        let rIndex = tempHex.index(index, offsetBy: 2)
//        let rHex = tempHex[index..<rIndex]
//        let gIndex = tempHex.index(rIndex, offsetBy: 2)
//        let gHex = tempHex[rIndex..<gIndex]
//        let bIndex = tempHex.index(gIndex, offsetBy: 2)
//        let bHex = tempHex[gIndex..<bIndex]
        // 使用后缀方式取子串
        tempHex = String(tempHex.suffix(tempHex.count - offset))
        let rHex = String(tempHex.suffix(tempHex.count - 2))
        let gHex = String(rHex.suffix(rHex.count - 2))
        let bHex = String(gHex.suffix(gHex.count - 2))
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: alpha)
    }
    
    
    /// 生成随机颜色（不透明）
    ///
    /// - Returns: 随机颜色对象
    class func randomColor() -> UIColor {
        
        return UIColor(r: CGFloat(arc4random() % 256),
                       g: CGFloat(arc4random() % 256),
                       b: CGFloat(arc4random() % 256))
    }
    
    
    /// 获取RGB颜色的差值
    ///
    /// - Parameters:
    ///   - color: 源颜色
    ///   - otherColor: 目的颜色
    /// - Returns: 源与目的颜色二者之间的差值
    class func getDistinction(_ color: UIColor, otherColor: UIColor) -> (CGFloat, CGFloat, CGFloat) {
        let firstComs = color.getRGB()
        let secondComs = otherColor.getRGB()
       
        return (firstComs.0 - secondComs.0, firstComs.1 - secondComs.1, firstComs.2 - secondComs.2)
    }
    
    
    /// 获取颜色RGB值（0-255）
    ///     非RGB颜色将会报错
    /// - Returns: RGB的三个值， 0.0 - 255.0
    func getRGB() -> (CGFloat, CGFloat, CGFloat) {
        guard let componts = self.cgColor.components else {
            fatalError("Make sure color is RBG")
        }
        guard componts.count != 3 else {
            fatalError("Get RBG value fail")
        }
        return (componts[0] * 255.0, componts[1] * 255.0, componts[2] * 255.0)
    }
}
