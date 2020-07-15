//
//  SecondSectionCellA.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SecondSectionCellA: UICollectionViewCell {
    
    @IBOutlet weak var innerCollectionView: UICollectionView!
    var productData: [ProductRecommendData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDefaultRequest()
        innerCollectionView.register(UINib.init(nibName: "SecondInnerCellA", bundle: nil), forCellWithReuseIdentifier: "SecondInnerCellAIdentifier")
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
    }
    
}

extension SecondSectionCellA: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondInnerCellAIdentifier", for: indexPath) as? SecondInnerCellA else { return UICollectionViewCell() }
        
        cell.bind(model: productData[indexPath.item])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = self.bounds.height - 3
        let width = height * (165/238)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 3, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


//MARK: - 통신
extension SecondSectionCellA {
    func setDefaultRequest() {
        
        ProductServices.productShared.getProductRecommendRequest { data in
            if let metaData = data {
                self.productData = metaData
                self.innerCollectionView.reloadData()
            }
        }
        
        ProductServices.productShared.getProductRecommendRequest { data in
            
            
        }
    }
}
