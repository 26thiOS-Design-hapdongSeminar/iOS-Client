//
//  FirstInnerCell.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FirstInnerCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var bottomText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomText.text = "사랑하는 문화를\n만들다."
        backgroundImage?.clipsToBounds = true
    }
}

