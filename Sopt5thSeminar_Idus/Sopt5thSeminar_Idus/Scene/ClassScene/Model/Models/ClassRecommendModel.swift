//
//  ClassModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - ProgressModel
struct ClassRecommendModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [ClassRecommendData]
}

// MARK: - Datum
struct ClassRecommendData: Codable {
    var classIdx, name: String
    var img: String
    var price, difficulty, term, remain: String
    var category, like: String

    enum CodingKeys: String, CodingKey {
        case classIdx, name, img, price, difficulty, term, remain, category
        case like = "Like"
    }
}
