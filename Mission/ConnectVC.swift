//
//  ConnectVC.swift
//  Mission
//
//  Created by 김은지 on 2023/05/07.
//

import Foundation
import UIKit




struct LinkData {
    var linkInput: String? = nil
}


class ConnectVC: UIViewController, UITableViewDelegate, UINavigationControllerDelegate {
    
    var selectedDeleteIndex: [IndexPath?] = []
    var unSelectedDeleteIndex: [IndexPath?] = []
    
    var inputDataList: [LinkData] = [LinkData()]
    
    var deleteIndex: [IndexPath?] = []
    
    var optIndexPathArray: IndexPath?
    
    @IBOutlet weak var selectedDeleteBtn: UIButton!
    @IBOutlet weak var connectTableView: UITableView!
    @IBOutlet weak var webSiteAddbtn: UIButton!
    
    @IBOutlet var finishBtn: UIButton!
    
    @IBOutlet weak var warningBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectTableView.dataSource = self
        connectTableView.delegate = self
        let myNib = UINib(nibName: "ConnectTableViewCell", bundle: .main)
        connectTableView.register(myNib, forCellReuseIdentifier: "ConnectTableViewCell")
        
        warningBtn.isHidden = true
      

        
    }
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
            print(#fileID, #function, #line, "-  주석 ")
        if inputDataList.count < 3 {
            inputDataList.append(LinkData())
            print(#fileID, #function, #line, "\(inputDataList.count)")
            connectTableView.reloadData()
        } else {
            warningBtn.isHidden = false
        }
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 완료 버튼이 눌러졌을 때")
        
        
        performSegue(withIdentifier: "NavToFirstVC", sender: self)
        
        
    }
    
    
    
    
    
    func closingSecondVC(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        let index = selectedDeleteIndex.compactMap{ $0 }
        var rowsArray: [Int] = []
        
        for i in index {
            let section = i.section
            let row = i.row
            rowsArray.append(row)
            print(section, row)
        }
        
        print(rowsArray)
        var rows: Int? = nil
        rowsArray.forEach{ (rows = $0) }
        print(rows)
        
        if let  rows = rows {
            print(rows)
            //데이터 지우기
            inputDataList.remove(at: rows)
            //셀 지우기
            connectTableView.deleteRows(at: [IndexPath(row: rows, section: 0)], with: .fade )
            connectTableView.reloadData()
        }
    }
        
    
    
    
    // 1. 수정할 수 있음
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 2. 셀 삭제 가능
    //    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        .delete
    //    }
    
    // 3. delete 발생 시 처리
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
}


extension ConnectVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputDataList.count
    }
    
    //    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .delete {
    //            //Delete the row from the data source to ensure consistency
    //            self.inputDataList.removeAtIndex(indexPath.row)
    //            connectTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        }
    //    }
    
    
    
    // cell과 통하는 포탈 같은 역할
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        if let cell: ConnectTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ConnectTableViewCell", for: indexPath) as? ConnectTableViewCell {
            
            self.optIndexPathArray = indexPath
            
            cell.indexPath = indexPath
            
            //            ((IndexPath, String) -> ())?
            //            cell.didChangeLinkText = {
            //             [weak self] indexPath, editString in
            //                self?.inputDataList[indexPath.row].linkInput = editString
            //            }
            cell.didChangeLinkText = changeLinkText(indexPath:changed:)
            
            
            cell.trashBtn.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        
            return cell
            
        }
        
        return UITableViewCell()
        
        
    }
    
    // 데이터 지우기
    @objc func deleteCell(_ sender: UIButton) {
        
        if let indexPathArray: IndexPath = optIndexPathArray {
            print(#fileID, #function, #line, "- \(indexPathArray)")
            if let  rowIndexPath = indexPathArray.last {
                print(rowIndexPath)
                //데이터 삭제
                inputDataList.remove(at: rowIndexPath)
                //셀 삭제
                connectTableView.deleteRows(at: [IndexPath(row: rowIndexPath, section: 0)], with: .fade )
                
                //                optIndexPathArray?.removeFirst()
                //                optIndexPathArray?.removeLast()
                // 인덱스 패스를 다시 안 불러오네...
                print(#fileID, #function, #line, "- indexPathArray 마지막: \(indexPathArray)")
                // 테이블뷰 다시 불러오기. ok 된다
                connectTableView.reloadData()
            }
        }
    }
    
  
 

 
    
    
    
    
    
    
    fileprivate func changeLinkText(indexPath:IndexPath, changed: String) {
        // 인풋데이터리스트[LinkData]의 linkInput에 적힌 글자 넣어주기
        inputDataList[indexPath.row].linkInput = changed
    }
    
}


