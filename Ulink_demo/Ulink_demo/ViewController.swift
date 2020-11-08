//
//  ViewController.swift
//  Ulink_demo
//
//  Created by 송지훈 on 2020/06/26.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit


extension UICollectionView {
 func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
     let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
     let mask = CAShapeLayer()
     mask.path = path.cgPath
     self.layer.mask = mask
 }}


class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate{
    
    
    
    var name : String?
    var timeIndex : Int?
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    var str_arr :[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]


    @IBOutlet weak var logo: UIImageView!

    
    @IBOutlet weak var timeTable: UICollectionView!
    
    
    
    override func viewWillAppear(_ animated: Bool){
        setLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setRadius()

        
        timeTable.delegate = self
        timeTable.dataSource = self
        presentationController?.delegate = self
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        timeTable.addGestureRecognizer(longPressGesture)
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "subView")
        pvc.transitioningDelegate = halfScreen(presentedViewController: pvc, presenting: pvc) as? UIViewControllerTransitioningDelegate
        pvc.modalPresentationStyle = .fullScreen

        self.present(pvc, animated: true, completion: nil)
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state)
        {
            
        case .began:
            guard let selectedIndexPath = timeTable.indexPathForItem(at: gesture.location(in: timeTable)) else {  break}
            
            timeTable.beginInteractiveMovementForItem(at: selectedIndexPath)
        
        case .changed:
            timeTable.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case .ended:
            timeTable.endInteractiveMovement()
        default:
            timeTable.cancelInteractiveMovement()
            
        }
    }
    

    

    func setRadius(){
        timeTable.roundCorners([.allCorners], radius: 10)
    }
    
    
    private func setLabel(){
        
        
        
        guard let title = self.name else {return}
        guard let time = self.timeIndex else { return }
  
        print(str_arr)
        
        
        
        
        
        str_arr[time-1] = title
        
        
        
        

        
        
        
        timeTable.reloadData()
        
        }

    
    
}



extension ViewController:UICollectionViewDelegate{
    

    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = str_arr.remove(at: sourceIndexPath.item)
        str_arr.insert(item, at:destinationIndexPath.item)
        print(str_arr)
    }
    
}
extension ViewController:UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "timeHeader", for: indexPath)
            
            
            return view
        default:
            assert(false, "Invalid")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeTableCell", for: indexPath) as! CollectionViewCell
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.cellLabel.text = str_arr[indexPath.row]
        
        return cell
    }
    
    
    
}


extension ViewController:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 80.0
        let width = 66.49
        
        return CGSize(width: width.rounded(), height: height.rounded())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
   

}

    

