//
//  HeaderCellA.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HeaderCellA: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var firstHeaderButton: UIButton!
    @IBOutlet weak var secondHeaderButton: UIButton!
    @IBOutlet weak var thirdHeaderButton: UIButton!

    func bind (model: TestModel) {
        headerLabel.font = UIFont.boldSystemFont(ofSize: 15)
        headerLabel.text = model.headerLabel
        firstHeaderButton = model.firstButton
        secondHeaderButton = model.secondButton
        thirdHeaderButton = model.thirdButton
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
