//
//  ViewController.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var outterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outterCollectionView.delegate = self
        outterCollectionView.dataSource = self
        outterCollectionView.register(UINib.init(nibName: "SixthSectionCellA", bundle: nil), forCellWithReuseIdentifier: "SixthSectionCellAIdentifier")
        outterCollectionView.layoutIfNeeded()
        
        setNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UICollectionView {
                view.frame = UIScreen.main.bounds
            } else if view is UICollectionViewCell {
                view.frame = UIScreen.main.bounds
                view.backgroundColor = UIColor.clear
            }
        }
   }
    
    func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.shadowImage = UIImage()
        
        guard let titleImage = UIImage(named: "idusLogo") else { return }
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFill
        self.navigationItem.titleView = titleImageView
        
        let hamburgerButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "homeBtnMenu"),
                                                               style: .plain,
                                                               target: self,
                                                               action: nil)
        
        let searchButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "homeBtnSearch"),
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
        
        navigationItem.leftBarButtonItem = hamburgerButton
        navigationItem.rightBarButtonItem = searchButton
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
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
            let height = width * (268 / 375)
            return CGSize(width: width, height: height)
        case 1:
            let width = self.view.bounds.width
            let height = width * (241 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
            return CGSize(width: width, height: height)
        case 2:
            let width = self.view.bounds.width
            let height = width * (102 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
            return CGSize(width: width, height: height)
        case 3:
            let width = self.view.bounds.width
            let height = width * (241 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
            return CGSize(width: width, height: height)
        case 4:
            let width = self.view.bounds.width
            let height = width * (451 / 375) // 240에서 Header: 40, Cell: 200인데 위에 3만큼 Inset
            return CGSize(width: width, height: height)
        default:
            assert(false)
        }
    }
    // MARK: - Header, Footer Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.zero
        } else {
            return CGSize(width: self.view.bounds.width, height: 44)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 16)
    }
}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCellA", for: indexPath) as? FirstSectionCellA else { return UICollectionViewCell() }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCellA", for: indexPath) as? SecondSectionCellA else { return UICollectionViewCell() }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdSectionCellA", for: indexPath) as? ThirdSectionCellA else { return UICollectionViewCell() }
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthSectionCellA", for: indexPath) as? FourthSectionCellA else { return UICollectionViewCell() }
            
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SixthSectionCellAIdentifier", for: indexPath) as? SixthSectionCellA else { return UICollectionViewCell() }
            
            return cell
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            switch indexPath.section {
            case 0:
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                return view
            case 1:
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                return view
            case 2:
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                //                view.headerLabel.text = "카테고리"
                //                view.firstHeaderButton.isHidden = true
                //                view.secondHeaderButton.isHidden = true
                //                view.thirdHeaderButton.isHidden = true
                
                return view
            case 3:
                //                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                let label = UILabel()
                label.font = .boldSystemFont(ofSize: 14)
                label.text = "실시간"
                
                let button1 = UIButton.init(frame: CGRect(x: 237, y: 0, width: self.view.bounds.width, height: 44))
                button1.titleLabel?.text = "구매"
                
                let button2 = UIButton.init(frame: CGRect(x: 281, y: 0, width: self.view.bounds.width, height: 44))
                button1.titleLabel?.text = "후기"
                
                let button3 = UIButton.init(frame: CGRect(x: 325, y: 0, width: self.view.bounds.width, height: 44))
                button1.titleLabel?.text = "추천"
                
                //                let constraints: NSLayoutConstraintLayout = [
                //                    label.leftAnchor.constraint(equalTo: view.leadingAnchor)
                //                    label.rightAnchor.constraint(equalTo: )
                //
                //                ]
                //                NSLayoutConstraint.activate(constraints)
                
                view.addSubview(label)
                view.addSubview(button1)
                view.addSubview(button2)
                view.addSubview(button3)
                
                return view
                
                
                
                //                view.headerLabel.text = "실시간"
                //                view.firstHeaderButton.titleLabel?.text =
                //                    "구매"
                //                view.secondHeaderButton.titleLabel?.text = "후기"
            //                view.thirdHeaderButton.titleLabel?.text = "추천"
            case 4:
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCellA", for: indexPath) as? HeaderCellA else { return UICollectionReusableView() }
                
                //                view.headerLabel.text = "인기 작가"
                //                view.firstHeaderButton.isHidden = true
                //                view.secondHeaderButton.isHidden = true
                //                view.thirdHeaderButton.isHidden = true
                //
                return view
            default:
                assert(false)
            }
            
        case UICollectionView.elementKindSectionFooter:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterCellA", for: indexPath) as? FooterCellA else { return UICollectionReusableView() }
            
            let backgroundview = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 16))
            backgroundview.backgroundColor = UIColor.idusColor(.backgroundGrayColor)
            
            view.addSubview(backgroundview)
            return view
        default:
            assert(false)
        }
    }
}
