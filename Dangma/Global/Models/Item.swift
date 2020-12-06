//
//  Items.swift
//  Dangma
//
//  Created by soyounglee on 2020/11/15.
//

import UIKit

struct Item: Codable {
    let productName: String?
    let idx, price, likeNum, commentNum: Int
    let createdAt: String
    let local: String?
    let imgLink: String
    
}

