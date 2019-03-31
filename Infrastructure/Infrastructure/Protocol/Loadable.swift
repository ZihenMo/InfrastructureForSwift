//
//  Loadable.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/23.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

protocol Loadable {
}

protocol NibLoadable: Loadable {
//    static var nibName: String {get set}
}

extension NibLoadable where Self:UIView  {
    static var nibName: String {
        return "\(self)"
    }
    
    /// 从xib中加载view实例
    ///
    /// - Parameter nibName: 文件名，默认同类名
    /// - Returns: view实例
    static func loadFormNib(_ nibName: String? = nil) -> Self {
        let nibName: String = nibName ?? self.nibName
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: [:])?.first as! Self
    }
}

protocol StoryBoardLodable: Loadable {
}

extension StoryBoardLodable where Self:UIViewController {
    /// 从StoryBoard加载默认VC
    ///
    /// - Parameter name: 文件名,默认同类名
    /// - Returns: VC实例
    static func loadFromStoryBoard(_ name: String? = nil) -> Self {
        let name = name ?? "\(self)"
        return UIStoryboard (name: name, bundle: nil).instantiateInitialViewController() as! Self
    }
    
    /// 从Main.StoryBoard中加载VC
    ///
    /// - Parameter identifier: 标识符
    /// - Returns: VC实例
    static func loadFromMainStoryBoard(_ identifier: String? = nil) -> Self {
        let identifier = identifier ?? "\(self)"
        return UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as! Self
    }
}
