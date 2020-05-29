//
//  FirstSectionCell.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FirstSectionCell: UICollectionViewCell {
    
    @IBOutlet weak var innerCollectionView: UICollectionView!
    
    let images: [UIImage] = [UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879"),
                             UIImage(imageLiteralResourceName: "img8879")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
        innerCollectionView.register(UINib.init(nibName: "FirstInnerCell", bundle: nil), forCellWithReuseIdentifier: "FirstInnerCellIdentifier")
        
    }
}

extension FirstSectionCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstInnerCellIdentifier", for: indexPath) as? FirstInnerCell else { return UICollectionViewCell() }
        
        cell.backgroundImage?.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.bounds.width
        let height = width * (210 / 375)
        
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

extension UICollectionViewCell {
    
    func register(for collectionView: UICollectionView) {
        // 범용성이 너무 없어염 describing
        let cellName = String(describing: self)
        let cellIdentifier = cellName + "Identifier"
        let cellNib = UINib(nibName: String(describing: self),
                            bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
