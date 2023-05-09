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
    
    var hi = 0
    
    var selectedDeleteIndex: [IndexPath?] = []
    var unSelectedDeleteIndex: [IndexPath?] = []
    var inputDataList: [LinkData] = [LinkData()]

    
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
        selectedDeleteBtn.isHidden = true
        
        webSiteAddbtn.addTarget(
            
            self, action: #selector(webSiteAddbtnClicked), for: .touchUpInside)
        
    }
    
    @objc func webSiteAddbtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 버튼테스트1")
        if inputDataList.count < 3 {
            // 2개 있을 때 하나 추가 가능해서 3개까지 추가 가능
            inputDataList.append(contentsOf: [LinkData()])
            connectTableView.reloadData()
            
            print("inputDataList.count:\(inputDataList.count)")}
        else {
            print("웹사이트는 3개까지 추가 가능합니다")
            warningBtn.isHidden = false
            
        }
        print(#fileID, #function, #line, "- 버튼테스트2")
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 완료 버튼이 눌러졌을 때")
        
        
        performSegue(withIdentifier: "NavToFirstVC", sender: self)
        
        
    }
    
    
    
    
    
    func closingSecondVC(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        
        print(#fileID, #function, #line, "- \(deleteBtnAction)")
        
        let finalDeleteIndex: [IndexPath?] = selectedDeleteIndex.filter {!unSelectedDeleteIndex.contains($0)}
        print(finalDeleteIndex)
        
        print(#fileID, #function, #line, "- finalDeleteIndex: \(finalDeleteIndex)")
//        selectedDeleteIndex.compactMap{ $0 }
//        print(selectedDeleteBtn)
        
        
            
            let rowIndexPath = selectedDeleteIndex.last

//            connectTableView.deleteRows(at: [checkCellIndexPath(row: , section: 0)], with: .fade
//            )
        }
        
        
//                       데이터 지우기
//                        inputDataList.remove(at: rowIndexPath)
//                        //셀 지우기
//                        connectTableView.deleteRows(at: [IndexPath(row: rowIndexPath, section: 0)], with: .fade)
        //
        //                optIndexPathArray?.removeFirst()
        //                optIndexPathArray?.removeLast()
        //                // 인덱스 패스를 다시 안 불러오네...
        //                    print(#fileID, #function, #line, "- indexPathArray 마지막: \(indexPathArray)")
        //                // 테이블뷰 다시 불러오기. ok 된다
//        connectTableView.reloadData()
//    }
    
    
    
    
    
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
            cell.checkBox.addTarget(self, action: #selector(checkBoxClikced), for: .touchUpInside)
            
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
                //데이터 지우기
                inputDataList.remove(at: rowIndexPath)
                //셀 지우기
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

    @objc func checkBoxClikced(_ sender: UIButton) {
            print(#fileID, #function, #line, "- 체크박스")
        if sender.configuration?.baseForegroundColor == .systemGreen {
            sender.configuration?.baseForegroundColor = .systemGray
            unSelectedDeleteIndex.append(optIndexPathArray)
                
            print(#fileID, #function, #line, "- unSelected")
        } else {
            sender.configuration?.baseForegroundColor = .systemGreen
            
            self.selectedDeleteBtn.isHidden = false
            selectedDeleteIndex.append(optIndexPathArray)
            
            print(#fileID, #function, #line, "- 체크박스 선택, \(selectedDeleteIndex)")
         
        }
        
        connectTableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    fileprivate func changeLinkText(indexPath:IndexPath, changed: String) {
        // 인풋데이터리스트[LinkData]의 linkInput에 적힌 글자 넣어주기
        inputDataList[indexPath.row].linkInput = changed
    }
    
}


