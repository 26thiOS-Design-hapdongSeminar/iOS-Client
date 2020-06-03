//
//  SecondInnerCellB.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SecondInnerCellA: UICollectionViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func bind (model: ProductRecommendData) {
        guard let modelPrice = model.price else { return }
        guard let imageURL = URL(string: model.img!) else { return }
        
        bannerImage.image = UIImage(contentsOfFile: model.img!)
        info.text = model.info
        productName.text = model.name
        productName.sizeToFit()
        price.text = "\(modelPrice)"
        
        do {
            let data = try Data(contentsOf: imageURL)
            bannerImage.image = UIImage(data: data)
        } catch (let err) {
            print(err.localizedDescription)
        }

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
