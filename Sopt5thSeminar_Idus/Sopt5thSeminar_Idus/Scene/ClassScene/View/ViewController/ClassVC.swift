//
//  SecondVC.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

protocol PageIndexDelegate {
    func selectMenuItem(_ pageIndex: Int)
}

class ClassVC: UIViewController {
    
    @IBOutlet weak var menuTabBarCollectionView: UICollectionView!
    var delegate: PageIndexDelegate?
    var pageInstance: PageVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTabBarCollectionView.delegate = self
        menuTabBarCollectionView.dataSource = self
        setNavigationBar()
        setFirstIndexIsSelected()
    }
    
    func setNavigationBar() {
        
        // Transparent
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.shadowImage = UIImage()
        
        // NavTitleImage, Left, RightButton
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PageSegue" {
            pageInstance = segue.destination as? PageVC
            pageInstance?.pageDelegate = self
        }
    }
}

extension ClassVC: PageIndexDelegate {
    func selectMenuItem(_ pageIndex: Int) {
        let indexPath = IndexPath(item: pageIndex, section: 0)
        menuTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension ClassVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCVCell", for: indexPath) as? MenuCVCell else { return UICollectionViewCell()}
        cell.viewPagerLabel.text = MenuIem.menuText[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cvIndexPath = indexPath.item
        guard let pageInstance = pageInstance else { return }
        print(pageInstance.getViewControllerAtIndex(index: cvIndexPath) as Any)
        
        pageInstance.setViewControllers([pageInstance.VCArray[cvIndexPath]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width )
        
        print (index)
    }
    
    func scrollToItem(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        
        print(indexPath)
        menuTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        menuTabBarCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setFirstIndexIsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuTabBarCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .bottom)
    }
}
