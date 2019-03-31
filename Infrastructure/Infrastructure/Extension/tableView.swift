//
//  tableViewCell.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/24.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {
}
extension UITableViewCell: NibLoadable {
}

extension UITableView {
    /// 注册cell
    /// Cell必须拥有与类名相同的Xib文件
    /// - Parameter _: Cell的类
    func register<T: UITableViewCell>(_: T.Type){
        do {
            let nib = UINib (nibName: T.nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        }
        catch {
            print("some error!")
        }
    }
    /// 复用Cell
    ///
    /// - Parameter indexPath
    /// - Returns: Cell实例
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
