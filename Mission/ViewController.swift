//
//  ViewController.swift
//  Mission
//
//  Created by 김은지 on 2023/05/05.
//

import UIKit

class ViewController: UIViewController {

    let webLinkNib = UINib(nibName: "WebLinkTableViewCell", bundle: .main)
    let webLinkCell = "WebLinkTableViewCell"

    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 등록
//        let webLinkNib = UINib(nibName: "WebLinkTableViewCell", bundle: .main)
//        let webLinkCell = "WebLinkTableViewCell"
        
        myTableView.dataSource = self
        
        myTableView.register(webLinkNib, forCellReuseIdentifier: webLinkCell)
    }

    @IBAction func backToMainVC(unwindSegue: UIStoryboardSegue) {
        
    }

    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navToAddVC", sender: self)
    }
    
    
    
    
}

// MARK: - TableView DataSource

// 셀의 행 표시
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell:WebLinkTableViewCell = myTableView.dequeueReusableCell(withIdentifier: webLinkCell, for: indexPath) as? WebLinkTableViewCell {
            return cell
        }
        
        return UITableViewCell()
    }
}
