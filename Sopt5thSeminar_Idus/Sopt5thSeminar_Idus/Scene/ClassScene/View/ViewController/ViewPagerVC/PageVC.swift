//
//  PageVC.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    var pageDelegate: PageIndexDelegate?
    var pendingPage: Int?
    let identifiers: NSArray = ["OnlineVC", "OfflineVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height+83)
//            self.view.frame.height
        }
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "OnlineVC"),
                self.VCInstance(name: "OfflineVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //MARK: - Before After
    internal func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCArray.firstIndex(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        if previousIndex < 0 {
            return VCArray.last
        } else {
            return VCArray[previousIndex]
        }
    }
    
    internal func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = VCArray.firstIndex(of: viewController) else { return nil }
        let nexIndex = vcIndex + 1
        if nexIndex >= VCArray.count {
            return VCArray.first
        } else {
            return VCArray[nexIndex]
        }
    }
    
    //MARK: - didFinish, pendingViewController - pending이 먼저 실행
    internal func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print("pending")
        pendingPage = self.identifiers.index(of: pendingViewControllers[0].restorationIdentifier ?? 0)
        // restorationIdentifier 설정해주기
    }
    
    internal func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            print("transitionFinished")
            var index: Int
            index = pendingPage ?? 0
            pageDelegate?.selectMenuItem(index)
        }
    }
    
    //MARK: - presentationCount, Index
    internal func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    internal func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard
            let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController)
            else { return 0 }
        return firstViewControllerIndex
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if index == 0 {
            guard let onlineVC = storyboard.instantiateViewController(identifier: "OnlineVC") as? OnlineVC
                else { return UIViewController() }
            return onlineVC
            
        } else if index == 1 {
            guard let offlineVC = storyboard.instantiateViewController(identifier: "OfflineVC") as? OfflineVC
                else { return UIViewController() }
            return offlineVC
        } else {
            return nil
        }
    }
}
