//
//  HomeService.swift
//  Dangma
//
//  Created by soyounglee on 2020/12/06.
//

import Foundation
import Alamofire

struct HomeService {
    static let shared = HomeService()
    func load(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = API.homeURL
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        dataRequest.responseData {(response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<Item>.self, from: data) else {
            return .pathErr
        }
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
}
