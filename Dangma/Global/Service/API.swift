//
//  API.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

import Foundation

struct API {
    static let baseURL = "http://3.35.243.187:3000"
    // 홈 뷰 조회 url
    static let homeURL = baseURL + "/productList"
    // 상세 페이지 조회 url
    static let detailURL = baseURL + "/product?productIdx"
    // 상세 페이지 이미지 조회 url
    static let detailImageURL = baseURL + "/product/image?productIdx"
}
