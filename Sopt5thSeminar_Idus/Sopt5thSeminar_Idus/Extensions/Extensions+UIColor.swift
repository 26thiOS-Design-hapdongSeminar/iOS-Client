//
//  Extensions+UIColor.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

enum AssetsColor {
    case backgroundGrayColor
    case darkGrayColor
    case tomatoColor
    
}

extension UIColor {
      static func idusColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .backgroundGrayColor:
            return UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        case .darkGrayColor:
            return UIColor(displayP3Red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        case .tomatoColor:
            return UIColor(displayP3Red: 220/255, green: 60/255, blue: 46/255, alpha: 1)
        }
    }
}
