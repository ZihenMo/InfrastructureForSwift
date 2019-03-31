//
//  ViewController.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/23.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let homeVC = HomeVC.loadFromMainStoryBoard()
        self.present(homeVC, animated: true);
    }

}

