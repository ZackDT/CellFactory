//
//  ShopCellFactory.swift
//  @018使用工厂模式的TableView
//
//  Created by Zack on 2017/11/15.
//  Copyright © 2017年 Zack. All rights reserved.
//

import UIKit


// 可选实现协议方法
@objc protocol ShopGoodsProtocol:NSObjectProtocol {
    // 也可以不可选，看需求
    @objc optional var model: ShopModel { get set}
    
    @objc optional func chooseShopGoods(cell: ShopGoodsProtocol, btn: UIButton)
    @objc optional func addShopGoods(cell: ShopGoodsProtocol, btn: UIButton)
    @objc optional func minusShopGoods(cell: ShopGoodsProtocol, btn: UIButton)
    @objc optional func showShopInf(cell: ShopGoodsProtocol, imgV: UIImageView)
}

extension ShopGoodsProtocol {
    //这里可以写一些默认实现
    func showShopInf(cell: ShopGoodsProtocol, imgV: UIImageView) {
        print(model?.imageName ?? "图片")
    }
}

// 具体的工厂
struct ShopFactory {
    static func createCell(model: ShopModel, tableView: UITableView, indexPath: IndexPath) -> ShopGoodsProtocol? {
        switch model.id {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: model.imageName!, for: indexPath) as! NormalCell
            cell.configCell(model)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: model.imageName!, for: indexPath) as! CarryGiftCell
            cell.configCell(model)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: model.imageName!, for: indexPath) as! FullGiftCell
            cell.configCell(model)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: model.imageName!, for: indexPath) as! StockoutCell
            cell.configCell(model)
            return cell
        default:
                return nil
        }
    }
}





