//
//  ProductSceneServices.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/03.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct ProductServices {
    
    static let productShared = ProductServices()
    func getProductRecommendRequest(completion: @escaping ([ProductRecommendData]?) -> Void) {
        
        let url = BaseAPIs.productRecommedURL
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method: .get, parameters: .none, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(ResponseResult<ProductRecommendData>.self, from: data)
                    if object.success {
                        completion(object.data)
                    } else {
                        completion(nil)
                    }
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
