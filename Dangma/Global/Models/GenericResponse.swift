//
//  GenericResponse.swift
//  Dangma
//
//  Created by soyounglee on 2020/12/06.
//

import Foundation

// MARK: - GenericResponse
struct GenericResponse<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [Item]
    
}

struct DetailResponse<T:Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ItemDetail]
}
