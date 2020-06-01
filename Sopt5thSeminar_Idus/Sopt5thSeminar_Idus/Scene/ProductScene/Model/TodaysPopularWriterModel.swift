//
//  TodaysPopularWriterModel.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - TodaysPopularWriter
struct TodaysPopularWriterModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [TodaysPopularWriterData]
}

// MARK: - Datum
struct TodaysPopularWriterData: Codable {
    var classIdx, explain, like, img: String

    enum CodingKeys: String, CodingKey {
        case classIdx, explain
        case like = "Like"
        case img
    }
}
