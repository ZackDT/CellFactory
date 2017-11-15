//
//  ShopModel.swift
//  @018使用工厂模式的TableView
//
//  Created by Zack on 2017/11/15.
//  Copyright © 2017年 Zack. All rights reserved.
//

import UIKit

class ShopModel: NSObject {
    var imageName: String?
    var title: String?
    var id: Int = 0
    var giftsArray: Array<Int>?
    init(imageName: String, title: String, id: Int, giftsArray: Array<Int>) {
        self.imageName = imageName
        self.title = title
        self.id = id
        self.giftsArray = giftsArray
    }
}
