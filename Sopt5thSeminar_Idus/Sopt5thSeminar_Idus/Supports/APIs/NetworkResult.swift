//
//  NetworkResult.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/03.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var success: Bool
    var message: String?
    var data: [T]?
}
