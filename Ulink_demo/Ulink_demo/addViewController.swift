//
//  addViewController.swift
//  Ulink_demo
//
//  Created by 송지훈 on 2020/06/26.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UICollectionViewDelegate {

    
    var weekTime : Int = 1
    var startTime : Int = 1
    var endTime : Int = 1
    var result : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func timeAddButton(_ sender: Any) {
        
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"viewController") as? ViewController else {return}
        
        
    
        result = 5 * (startTime-9) + weekTime + 1

        
        print("\(textField.text ?? "")")
        print("\(result-1)")
        print("modal end")
        
        
        receiveViewController.name = textField.text ?? ""   
        receiveViewController.timeIndex = result-1
        
        
        
        present(receiveViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBAction func setWeekTime(_ sender: UISegmentedControl) {
        
        switch(sender.selectedSegmentIndex)
        {
        case 0:
            print("MONDAY")
            weekTime = 1
        case 1:
            print("TUESDAY")
            weekTime = 2
        case 2:
            print("WEDNESDAY")
            weekTime = 3
        case 3:
            print("THURSDAY")
            weekTime = 4
        case 4:
            print("FRIDAY")
            weekTime = 5
        default :
            break
            
        }
    }
    
    @IBAction func setStartTime(_ sender: UISegmentedControl) {
        
        switch(sender.selectedSegmentIndex)
        {
        case 0:
            startTime = 9
        case 1:
            startTime = 10
        case 2:
            startTime = 11
        case 3:
            startTime = 12
        case 4:
            startTime = 13
        case 5:
            startTime = 14
        default :
            break
            
        }
        
    }
    
    
    @IBAction func setEndTime(_ sender: UISegmentedControl) {
        
        switch(sender.selectedSegmentIndex)
        {
        case 0:
            startTime = 9
        case 1:
            startTime = 10
        case 2:
            startTime = 11
        case 3:
            startTime = 12
        case 4:
            startTime = 13
        case 5:
            startTime = 14
        default :
            break
            
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
