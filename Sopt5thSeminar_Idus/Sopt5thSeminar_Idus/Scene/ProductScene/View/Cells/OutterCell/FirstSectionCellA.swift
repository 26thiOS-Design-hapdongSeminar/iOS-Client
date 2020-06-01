//
//  FirstSectionCellA.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FirstSectionCellA: UICollectionViewCell {
    
    @IBOutlet weak var innerCollectionView: UICollectionView!
    
    let images: [UIImage] = [UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd"),
                             UIImage(imageLiteralResourceName: "homeSliderAd")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        innerCollectionView.register(UINib.init(nibName: "FirstInnerCellA", bundle: nil), forCellWithReuseIdentifier: "FirstInnerCellAIdentifier")
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self

    }
}

extension FirstSectionCellA: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstInnerCellAIdentifier", for: indexPath) as? FirstInnerCellA else { return UICollectionViewCell() }
        
        cell.BannerImage?.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.bounds.width
        let height = width * (268 / 375)
        
        print("width : \(width), height : \(height)")
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


