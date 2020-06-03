//
//  ProgressClassModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - ProgressModel
struct ClassProgressModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [ClassProgressData]
}

// MARK: - Datum
struct ClassProgressData: Codable {
    var classIdx, name: String
    var img: String
    var price, difficulty, term, remain: String
    var category, like: String

    enum CodingKeys: String, CodingKey {
        case classIdx, name, img, price, difficulty, term, remain, category
        case like = "Like"
    }
}
