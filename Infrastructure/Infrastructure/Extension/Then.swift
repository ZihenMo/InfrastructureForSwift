//
//  Then.swift
//  AccountKoala
//
//  Created by 何雨晴 on 2017/6/13.
//  Copyright © 2017年 何雨晴. All rights reserved.
//

import Foundation
import CoreGraphics

public protocol Then {}

extension Then where Self: Any {
    
    /// copy 一份数据，并做某些事，返回一个新值
    ///
    ///     let frame = CGRect().with {
    ///       $0.origin.x = 10
    ///       $0.size.width = 100
    ///     }
    public func with(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
    
    /// 做某些事，不返回对象
    ///
    ///     UserDefaults.standard.do {
    ///       $0.set("devxoul", forKey: "username")
    ///       $0.set("devxoul@gmail.com", forKey: "email")
    ///       $0.synchronize()
    ///     }
    public func `do`(_ block: (Self) -> Void) {
        block(self)
    }
    
}

extension Then where Self: AnyObject {
    
    /// 初始化对象，并做一些动作
    ///
    ///     let label = UILabel().then {
    ///       $0.textAlignment = .Center
    ///       $0.textColor = UIColor.blackColor()
    ///       $0.text = "Hello, World!"
    ///     }
    public func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
}

extension NSObject: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}

