//
//  NetworkResult.swift
//  Dangma
//
<<<<<<< HEAD
//  Created by soyounglee on 2020/12/05.
//

import Foundation
=======
//  Created by 오준현 on 2020/11/20.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
>>>>>>> develop
