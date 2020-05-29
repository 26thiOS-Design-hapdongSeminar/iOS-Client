//
//  MenuCVCell.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class MenuCVCell: UICollectionViewCell {
    
    @IBOutlet weak var viewPagerLabel: UILabel!
    @IBOutlet weak var menuUnderBar: UIView!
    var delegate: PageIndexDelegate?
    
    var collectionView: UICollectionView?
    
    override var isHighlighted: Bool {
        didSet {
            viewPagerLabel.font = isSelected ? .boldSystemFont(ofSize: 12) : .systemFont(ofSize: 12)
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.viewPagerLabel.textColor = self.isSelected ? UIColor.idusColor(.tomatoColor) : UIColor.idusColor(.darkGrayColor)
                self.menuUnderBar.backgroundColor = UIColor.idusColor(.tomatoColor)

                self.menuUnderBar.layoutIfNeeded()
                self.menuUnderBar.alpha = self.isSelected
                    ? 1 : 0
            }, completion: nil)
        }
    }
    override var isSelected: Bool {
        didSet {
            viewPagerLabel.font = isSelected ? .boldSystemFont(ofSize: 12) : .systemFont(ofSize: 12)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.menuUnderBar.backgroundColor = UIColor.idusColor(.tomatoColor)
                self.viewPagerLabel.textColor = self.isSelected ? UIColor.idusColor(.tomatoColor) : UIColor.idusColor(.darkGrayColor)
                self.menuUnderBar.alpha = self.isSelected ? 1 : 0
                self.menuUnderBar.layoutIfNeeded()
            }, completion: nil)
        }
    }

}
