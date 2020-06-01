//
//  RecommendModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - ProductRecommend
struct ProductRecommendModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [ProductRecommendData]
}

// MARK: - Datum
struct ProductRecommendData: Codable {
    var recommandIdx, name: String
    var img: String
    var price, explain, like: String

    enum CodingKeys: String, CodingKey {
        case recommandIdx, name, img, price, explain
        case like = "Like"
    }
}
