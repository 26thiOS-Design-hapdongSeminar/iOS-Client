//
//  FirstInnerCellA.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FirstInnerCellA: UICollectionViewCell {
   
    @IBOutlet weak var BannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BannerImage.clipsToBounds = true

    }

}
