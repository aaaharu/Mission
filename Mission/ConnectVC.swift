//
//  ConnectVC.swift
//  Mission
//
//  Created by 김은지 on 2023/05/07.
//

import Foundation
import UIKit


struct Data {
    let link: [String] = []
}

struct LinkData {
    var linkInput: String? = nil
}


class ConnectVC: UIViewController, UITableViewDelegate, UINavigationControllerDelegate {
    
    
    var inputDataList: [LinkData] = [LinkData(), LinkData(), LinkData()]
    
    
    
    
    
    
    var webVC: WebLinkTableViewCell? = WebLinkTableViewCell()
    
    
    var linkStored: String? = nil
    
    
    @IBOutlet weak var connectTableView: UITableView!
    
    
    @IBOutlet var finishBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectTableView.dataSource = self
        connectTableView.delegate = self
        let myNib = UINib(nibName: "ConnectTableViewCell", bundle: .main)
        connectTableView.register(myNib, forCellReuseIdentifier: "ConnectTableViewCell")
        
        
        
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 완료 버튼이 눌러졌을 때")
        
        
        performSegue(withIdentifier: "NavToFirstVC", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#fileID, #function, #line, "- segue.destination: \(segue.destination)")
        
        if segue.identifier == "NavToFirstVC" {
            
            if let firstVC = segue.destination as? ViewController {
                
                
            }
            
        }
    }
}

func closingSecondVC(unwindSegue: UIStoryboardSegue) {
    
}





// 1. 수정할 수 있음
func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
}

// 2. 셀 삭제 가능
func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    .delete
}

// 3. delete 발생 시 처리
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        
    }
}



extension ConnectVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        if let cell: ConnectTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ConnectTableViewCell", for: indexPath) as? ConnectTableViewCell {
            
            cell.indexPath = indexPath
            
            //            ((IndexPath, String) -> ())x?
            //            cell.didChangeLinkText = {
            //             [weak self] indexPath, editString in
            //                self?.inputDataList[indexPath.row].linkInput = editString
            //            }
            cell.didChangeLinkText = changeLinkText(indexPath:changed:)
            return cell
        }
        
        return UITableViewCell()
        
        
    }
    fileprivate func changeLinkText(indexPath:IndexPath, changed: String) {
        inputDataList[indexPath.row].linkInput = changed
    }
    
    
}

