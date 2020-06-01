//
//  BannerModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - BannerModel
struct BannerModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [BannerData]
}

// MARK: - Datum
struct BannerData: Codable {
    var imgIdx: String
    var img: String
}
