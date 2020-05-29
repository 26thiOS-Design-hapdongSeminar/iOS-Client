//
//  ThirdSectionCellA.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ThirdSectionCellA: UICollectionViewCell {
    
    @IBOutlet weak var innerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        innerCollectionView.register(UINib.init(nibName: "ThirdInnerCellA", bundle: nil), forCellWithReuseIdentifier: "ThirdInnerCellAIdentifier")
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
        
        
    }
}

extension ThirdSectionCellA: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdInnerCellAIdentifier", for: indexPath) as? ThirdInnerCellA else { return UICollectionViewCell() }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let height = self.bounds.height - 1
        let width = height * (60/101)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}

