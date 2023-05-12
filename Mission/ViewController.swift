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



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerDelegate {
  
    var indexPathRowArray: [Int] = []
    


    
    //selectedTags(버튼이 눌린 태그를 IndexPath.row로 치환해서 저장한 변수)

    var selectedTags = Set<Int>()
    
    
    func deleteLink(indexpath: IndexPath) {
        print(#fileID, #function, #line, "- \(indexpath)")
        // 1. 인덱스패스에 접근해서 linkArray의 선택된 셀의 데이터를 지운다.
        linkArray.remove(at: indexpath.row)
        // 2. 셀을 지운다.
        myTableView.reloadData()
    }
    
    
    
    var getIndexPath: IndexPath? = nil
    
    var linkArray: [String] = []
    
    @IBOutlet weak var selectedDeleteBtn: UIButton!
    
    
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
        myTableView.delegate = self
        
        myTableView.isUserInteractionEnabled = true
        myTableView.allowsSelection = true
        
        
        myTableView.register(webLinkNib, forCellReuseIdentifier: webLinkCell)
        
        
        
        
        
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
    
    @IBAction func selectedCellDelete(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
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
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "WebLinkTableViewCell") as? WebLinkTableViewCell {
            
            // 버튼이 눌려지면 태그 값은 인덱스 패스 값을 받아온다. (didSelectRow에 데이터가 가기 위해서, 버튼만 누르면 셀 선택 감지 X)
//            cell.selectBtn.tag = indexPath.row
            
            
            // 태그값, 즉 버튼이 눌러져서 태그값이 전달되어 인덱스패스값으로 전환되었다면
            // 해당 셀의 버튼은 눌려진 상태로 표시한다.
//            if selectedTags.contains(indexPath.row) {
//                cell.selectBtn.isSelected = true
//            } else {
//                cell.selectBtn.isSelected = false
//            }
            
            
            getIndexPath = indexPath
            
            // 링크 배열 안의 스트링에 있는 인덱스 패스를 읽어서 문자를 가져오기
            let linkData: String = linkArray[indexPath.row]
            
            // 셀의 버튼 글자를 링크 배열의 글자로 바꿔주기
            cell.linkNameButton.setTitle(linkData, for: .normal)
            print(#fileID, #function, #line, "- 테스트\(indexPath)")
            
            // 셀의 인덱스 패스는 테이블뷰가 가지고 있는 인덱스 패스
            cell.indexPath = indexPath
            
          
    
            
            cell.celldelegate = self
            cell.delegate = self // 셀의 델리게이트는 viewcontroller이다.
            
            
            cell.linkNameButton.addTarget(self, action: #selector(linkGo), for: .touchUpInside)
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = myTableView.dequeueReusableCell(withIdentifier: "WebLinkTableViewCell") as? WebLinkTableViewCell {
//
//            // 버튼의 태그 값은 눌려진 인덱스패스 값이다. (cellForRow와 함께)
//            cell.selectBtn.tag = indexPath.row
//            print(#fileID, #function, #line, "- cell.selectBtn.tag: \(cell.selectBtn.tag)")
//
//            //selectedTags(버튼이 눌린 태그를 IndexPath.row로 치환해서 저장한 변수)
//
//            // tag(indexPath.row)값이 이미 있다면 그 값을 삭제해라
//            if selectedTags.contains(indexPath.row) {
//                selectedTags.remove(indexPath.row)
//            // 그 값이 없다면 태그모음에 에 저장해라
//            } else {
//                selectedTags.insert(indexPath.row)
//            }
//
//            // 테이블뷰 다시 로드
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//
//
//            print(#fileID, #function, #line, "- selectedTags: \(selectedTags)")
//
//        }
    }
    
    
    
    @IBAction func selectedDelete(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        
        // 1. 인덱스패스에 접근해서 linkArray의 선택된 셀의 데이터를 지운다.
        // 내림차순으로 정렬해야 오류가 안 생김. 그대로 삭제 하면 삭제할 떄마다 인덱스가 바뀌면서 오류 발생
        for i in indexPathRowArray.sorted(by: >) {
            linkArray.remove(at: i)
            print(#fileID, #function, #line, "- indexpathRow: \(indexPathRowArray)")
           
        }
        
        // 2. 셀을 지운다.(리로드)
        myTableView.reloadData()
        // 선택된 버튼의 인덱스로우 배열 데이터를 삭제해준다(새거로 만들기)
        indexPathRowArray.removeAll()
        
        
        //        // Set -> Array
        //        let myArray = Array(selectedTags)
        //
        //        var myIndexPathRow: Int? = nil
        //
        //        // Array -> Int
        //        for num in myArray {
        //            myIndexPathRow = num
        //        }
        //
        //        print(#fileID, #function, #line, "- myIndex\(String(describing: myIndexPathRow))")
        //
        //        // Int (IndexPath.row)
        //        if let myIndexPathRow = myIndexPathRow {
        //
        //            // 1. 선택된 셀의 인덱스를 selectedTag에서 제거한다. (셀이 삭제되어도 담겨 있는 값은 그대로 있기 떄문에)
        //            selectedTags.remove(myIndexPathRow)
        //
        //            // 2. 인덱스패스에 접근해서 linkArray의 선택된 셀의 데이터를 지운다.
        //            linkArray.remove(at: myIndexPathRow)
        //
        //            // 3. 셀을 지운다.
        //            myTableView.reloadData()
        //
        //        }
        
    }
    
    
    @objc func linkGo(_ sender: UIButton) {
        print(#fileID, #function, #line, "- <# 주석 #>")
        if let getIndexPath = getIndexPath {
            let linkData: String = "https://" + "\(linkArray[getIndexPath.row])"
            print(#fileID, #function, #line, "- <# 주석 #>")
            guard let settingsUrl = URL(string: linkData) else {
                print(#fileID, #function, #line, "- linkData:\(linkData)")
                return
            }
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
            print(#fileID, #function, #line, "- <# 주석 #>")
        }
    }
    
    
    
    
}




extension ViewController: WebLinkTableViewCellDelegate {
    
    // 여기서부터 didSelectButton은 내가 지휘한다
    // 지뢰 심기
    func didSelectButton(sender: WebLinkTableViewCell) {
       
        guard let indexPath = self.myTableView.indexPath(for: sender) else { return }
        
        // sender의 버튼이 눌러졌을 때
        if sender.selectBtn.isSelected {
            // 1. 버튼을 초록색으로 바꾸고
            sender.selectBtn.configuration?.baseForegroundColor = .systemGreen
            // 2. 인덱스패스로우 값이 Array에 들어가 있지 않다면
            if !self.indexPathRowArray.contains(indexPath.row) {
                // 인덱스패스로우 배열에 추가한다
                self.indexPathRowArray.append(indexPath.row)
                print(#fileID, #function, #line, "- indexPathRowArray: \(self.indexPathRowArray)")
            }
        }
        // sender의 버튼이 선택해제 되었을 때
        else {
            // 1. 센더의 버튼을 회색으로 바꾼다
            sender.selectBtn.configuration?.baseForegroundColor = .lightGray
            // 2. IndexPath값이 들어가 있다면 그 index를 찾아서
            if let index = self.indexPathRowArray.firstIndex(of: indexPath.row) {
                // 3. Array에서 row 값을 지운다.
                self.indexPathRowArray.remove(at: index)
                print(#fileID, #function, #line, "- indexPathRowArray: \(self.indexPathRowArray)")
                
            }
        }
    }
}
    

    




