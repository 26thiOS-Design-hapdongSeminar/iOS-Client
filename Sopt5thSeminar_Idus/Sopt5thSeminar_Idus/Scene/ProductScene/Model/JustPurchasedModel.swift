//
//  JustPurchasedModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - JustPurchased
struct JustPurchasedModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [JustPurchasedData]
}

// MARK: - Datum
struct JustPurchasedData: Codable {
    var liveIdx, name: String
    var img: String
    var price, explain, like: String

    enum CodingKeys: String, CodingKey {
        case liveIdx, name, img, price, explain
        case like = "Like"
    }
}
