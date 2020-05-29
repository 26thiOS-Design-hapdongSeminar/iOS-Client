//
//  OfflineVC.swift
//  Sopt5thSeminar_Idus
//
//  Created by elesahich on 2020/05/24.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class OfflineVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension OfflineVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let returnCell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
 
        let label = UILabel.init(frame: CGRect(x: 20, y: 10, width: 100, height: 30))
        label.text = "1"
        returnCell.addSubview(label)
        
        return returnCell
        
    }
    
    
}
