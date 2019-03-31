//
//  Reusable.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/23.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

protocol Reusable: class {
}


extension Reusable where Self:UIView  {
    static var reuseIdentifier: String{
        get {
            return "\(self)"
        }
        set { }
    }
}




