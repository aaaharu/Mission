//
//  ViewController.swift
//  Mission
//
//  Created by 김은지 on 2023/05/05.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 등록
        let webLinkNib = UINib(nibName: "WebLinkTableViewCell", bundle: .main)
        let webLinkCell = "WebLinkTableViewCell"
        
        myTableView.dataSource = self
        myTableView.register(webLinkNib, forCellReuseIdentifier: webLinkCell)
    }


}

