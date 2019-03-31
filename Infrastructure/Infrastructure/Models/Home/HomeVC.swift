//
//  HomeVC.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/23.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    lazy var tableView: UITableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
}
extension HomeVC {
    func setupUI() {
        tableView.frame = self.view.bounds
        tableView.register(HomeCell.self)
        tableView.register(ProductCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 10 {
            return tableView.dequeueReusableCell(indexPath) as HomeCell
        }
        return tableView.dequeueReusableCell(indexPath) as ProductCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension HomeVC: StoryBoardLodable {}

