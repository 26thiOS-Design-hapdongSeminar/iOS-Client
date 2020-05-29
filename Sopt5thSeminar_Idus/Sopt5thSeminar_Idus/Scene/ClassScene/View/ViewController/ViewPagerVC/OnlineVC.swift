//
//  OnlineVC.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class OnlineVC: UIViewController {
    
    @IBOutlet weak var outterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        DispatchQueue.main.async {
//            self.outterCollectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 611)
//        }
        outterCollectionView.delegate = self
        outterCollectionView.dataSource = self
    }
}

// 아래 사이즈 추가 후 Model 설정 후 데이터 대입
extension OnlineVC: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
	
    
    // Inset과 Spacing은 모두 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           switch indexPath.section {
           case 0:
               let width = self.view.bounds.width
               let height = width * (210 / 375)
               return CGSize(width: width, height: height)
           case 1:
               let width = self.view.bounds.width
               let height = width * (197 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
               return CGSize(width: width, height: height)
           case 2:
               let width = self.view.bounds.width
               let height = width * (197 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
               return CGSize(width: width, height: height)
           default:
               assert(false)
           }
       }
    
    
    // MARK: - Header, Footer Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.zero
        } else if section == 1 || section == 2 {
            return CGSize(width: self.view.bounds.width, height: 40)
        } else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 2 {
            return CGSize(width: self.view.bounds.width, height: 135)
        } else {
            return CGSize(width: self.view.bounds.width, height: 16)

        }
    }
 }

extension OnlineVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCell", for: indexPath) as? FirstSectionCell else { return UICollectionViewCell() }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCell", for: indexPath) as? SecondSectionCell else { return UICollectionViewCell() }
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdSectionCell", for: indexPath) as? ThirdSectionCell else { return UICollectionViewCell() }
            
            return cell
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as? HeaderCell else { return UICollectionReusableView() }
            
            // indexPath == 1일때 button.ishidden = true
            if indexPath.section == 1 {
                view.latestButton.isHidden = true
                view.popularButton.isHidden = true
                view.recommendButton.isHidden = true
                
                return view
            } else if indexPath.section == 2 {
                view.headerLabel.text = "진행 중인 클래스"
                return view
            } else {
                return UICollectionReusableView()
            }

        case UICollectionView.elementKindSectionFooter:
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterCell", for: indexPath) as? FooterCell else { return UICollectionReusableView() }
            
            let backgroundview = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 16))
            backgroundview.backgroundColor = UIColor.idusColor(.backgroundGrayColor)
            
            view.addSubview(backgroundview)
            return view
        default:
            assert(false)
        }
    }
}
