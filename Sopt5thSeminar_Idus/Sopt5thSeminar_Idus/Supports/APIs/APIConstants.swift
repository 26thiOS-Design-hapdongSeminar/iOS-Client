//
//  APIConstants.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/06/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct BaseAPIs {
    static let baseURL = "http://52.79.90.119:3002"
    
    static let bannerURL = baseURL + "/banner"
    static let classRecommedURL = baseURL + "/class/recommand"
    static let progressURL = baseURL + "/class/progress"
    static let productRecommedURL = baseURL + "/product/recommand"
    static let justPurchasedURL = baseURL + "/product/live"
    static let popularwriterURL = baseURL + "/product/write"
}
