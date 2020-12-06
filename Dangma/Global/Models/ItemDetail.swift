//
//  ItemDetail.swift
//  Dangma
//
//  Created by soyounglee on 2020/12/06.
//

import UIKit

struct ItemDetail: Codable {
    let idx, price: Int
    let category, detail: String
    let likeNum, commentNum, viewCnt: Int
    let upAgain: String
    let isNegoAble, userIdx: Int
    let createdAt, productName: String
    let manner: Int
    let local, nickName, userImg: String

    enum CodingKeys: String, CodingKey {
        case idx, price, category, detail, likeNum, commentNum, viewCnt, upAgain, isNegoAble
        case userIdx = "user_idx"
        case createdAt, productName, manner, local, nickName
        case userImg = "user_img"
    }
}
