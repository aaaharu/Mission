//
//  ConnectVC.swift
//  Mission
//
//  Created by 김은지 on 2023/05/07.
//

import Foundation
import UIKit

class ConnectVC: UIViewController {
    
    @IBOutlet weak var connectTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectTableView.dataSource = self
        let myNib = UINib(nibName: "ConnectTableViewCell", bundle: .main)
        connectTableView.register(myNib, forCellReuseIdentifier: "ConnectTableViewCell")
        
    }
}

extension ConnectVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: ConnectTableViewCell = connectTableView.dequeueReusableCell(withIdentifier: "ConnectTableViewCell", for: indexPath) as? ConnectTableViewCell
        {
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
