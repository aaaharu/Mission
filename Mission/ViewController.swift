//
//  ViewController.swift
//  Mission
//
//  Created by 김은지 on 2023/05/05.
//

import UIKit

protocol ViewControllerDelegate: AnyObject{
    func deleteLink(indexpath: IndexPath)
}


class ViewController: UIViewController, UITableViewDataSource, ViewControllerDelegate {
    func deleteLink(indexpath: IndexPath) {
            print(#fileID, #function, #line, "- \(indexpath)")
        // 1. 인덱스패스에 접근해서 linkArray의 선택된 셀의 데이터를 지운다.
        linkArray.remove(at: indexpath.row)
        // 2. 셀을 지운다.
//        myTableView.deleteRows(at: [indexpath], with: .fade)
        myTableView.reloadData()
    }
    
    
    
    var linkArray: [String] = ["asdfasadfasdfasdfasdfasdfasd","dseafwefawfwafe",
                               "etretwtqtrtrtrtrtrtr", "bbfbbbxxjjjjj"]
    
    
    
    var connectVC: ConnectVC? = ConnectVC()
    
    
    
    let webLinkNib = UINib(nibName: "WebLinkTableViewCell", bundle: .main)
    let webLinkCell = "WebLinkTableViewCell"
    
    
    @IBOutlet weak var myTableView: UITableView!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableView.dataSource = self
        
        
        myTableView.register(webLinkNib, forCellReuseIdentifier: webLinkCell)
        
        
        
        
        
    }
    
    
    func sendData(string: String) {
        // connectVC에서 전달된 값을 받아서
        // 텍스트뷰에 채운다.
        print(#fileID, #function, #line, "- <# 주석 #>")
        //        getLink.append(string)
        myTableView.reloadData()
        
        
    }
    
    @IBAction func backToMainVC(unwindSegue: UIStoryboardSegue) {
//                self.myTableView.reloadData()
        if let secondVC = unwindSegue.source as? ConnectVC {
            // 데이터 리스트 가져오기
            let dataList:[LinkData] = secondVC.inputDataList
            print(#fileID, #function, #line, "\(dataList.count)")
            // [LinkData] -> [String] 데이터 리스트의 타입을 linkunput객체에 string 배열로 넣어주기
            let linkInputList: [String] = dataList.compactMap{ $0.linkInput }
            // 스트링 배열이 가지고 있는 인덱스 패스 배열 가져오기
                // appendLink에서 linkArray에 새로운 글자 담아주기
                    // Indexpath 자리값이 가지고 있는 스트링 반환해주기
            let indexPathList: [IndexPath] = linkInputList.map{ appendLink(newLink: $0) }
            // 테이블뷰에 인덱스 패스 추가하기
            myTableView.insertRows(at: indexPathList, with: .fade)
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        if let secondVC = segue.source as? ConnectVC {
//
//                print(#fileID, #function, #line, "- \(secondVC.inputDataList)")
//        }
        
    }
    
    // 스트링 배열을 빼서 스트링이 가지고 있는 인덱스 패스 가져오기
    func appendLink(newLink: String) -> IndexPath {
        // 데이터를 담아주는 링크 배열에 새로운 문자열 데이터를 담아주기
        linkArray.append(newLink)
        // 데이터가 가질 인덱스 패스 자리 넣어주기
        let indexPath = IndexPath(row: linkArray.count - 1, section: 0)
        // 인덱스 패스 반환하기
        return indexPath
    }
    
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "navToAddVC", sender: self)
        
        
//        linkArray.append("asdfasdfasf")
//        let indexPath = IndexPath(row: linkArray.count - 1, section: 0)
//        myTableView.insertRows(at: [indexPath], with: .fade)
//
    }
    
    //    func sendData(VC connectVC: ConnectVC, Input linkStored: String) {
    //        print(#fileID, #function, #line, "Send Data 함수 실행")
    //        print(linkStored)
    //    }
    // 셀의 인덱스 가져오기
    //
    //        if let indexPath = myTableView.indexPathForSelectedRow {
    
    // 인덱스를 가져오기 위해서 인덱스를 위에 정의해주기, 셀 만들어주기
    
    // 보이는 셀의 인덱스 다 가져오기
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#fileID, #function, #line, "- <# 주석 #>")
        return linkArray.count
    }
    
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        if let cell:WebLinkTableViewCell = myTableView.dequeueReusableCell(withIdentifier: webLinkCell, for: indexPath) as? WebLinkTableViewCell {
    //            return cell
    //        }
    //       return UITableViewCell()
    //    }
    //
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "WebLinkTableViewCell") as? WebLinkTableViewCell {
            
            // 링크 배열 안의 스트링에 있는 인덱스 패스를 읽어서 문자를 가져오기
            let linkData: String = linkArray[indexPath.row]
            
            // 셀의 버튼 글자를 링크 배열의 글자로 바꿔주기
            cell.linkNameButton.setTitle(linkData, for: .normal)
            print(#fileID, #function, #line, "- 테스트\(indexPath)")
        
            // 셀의 인덱스 패스는 테이블뷰가 가지고 있는 인덱스 패스
            cell.indexPath = indexPath
            
            cell.delegate = self // 데이터 기반이다. 데이터를 지우고 셀에 대한 것을 지워야함
            
            
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
    
    
}




