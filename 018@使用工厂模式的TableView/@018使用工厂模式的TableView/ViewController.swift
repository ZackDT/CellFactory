//
//  ViewController.swift
//  @018使用工厂模式的TableView
//
//  Created by Zack on 2017/11/15.
//  Copyright © 2017年 Zack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        

        
    }
    
    fileprivate lazy var tableView: UITableView = {
       let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.register(NormalCell.self, forCellReuseIdentifier: dataArray[0].imageName!)
        tableView.register(CarryGiftCell.self, forCellReuseIdentifier: dataArray[1].imageName!)
        tableView.register(FullGiftCell.self, forCellReuseIdentifier: dataArray[2].imageName!)
        tableView.register(StockoutCell.self, forCellReuseIdentifier: dataArray[3].imageName!)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let dataArray:Array<ShopModel> = [
        ShopModel(imageName: "NormalCell", title: "NormalCell", id: 1, giftsArray: [1]),
        ShopModel(imageName: "CarryGiftCell", title: "CarryGiftCell", id: 2, giftsArray: [1, 2]),
        ShopModel(imageName: "FullGiftCell", title: "FullGiftCell", id: 3, giftsArray: [1, 2, 3]),
        ShopModel(imageName: "StockoutCell", title: "StockoutCell", id: 4, giftsArray: [1, 2, 3, 4])
    ]
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShopFactory.createCell(model: self.dataArray[indexPath.row], tableView: tableView, indexPath: indexPath)
        return cell as! UITableViewCell
    }
}
