//
//  UIImageView-Extension.swift
//  Mzh Live
//
//  Created by mozihen on 2019/1/19.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit
//import Kingfisher

extension UIImageView {
    /// 使用KingFisher设置网络图片与本地占位图片
    ///
    /// - Parameters:
    ///   - url: 网络图url
    ///   - placeHolder: 本地图路径名
    func setImage(_ urlStr: String?, placeholder: String) -> Void {
        guard let urlStr = urlStr else {
                return
        }
        let url = URL(string: urlStr)
        let placeholderImage = UIImage(named: placeholder)
//        kf.setImage(with: url, placeholder: placeholderImage)
    }
}
