//
//  WebLinkViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/05.
//

import Foundation
import UIKit

class WebLinkTableViewCell: UITableViewCell {
    @objc func sendData(string: String) {
            print(#fileID, #function, #line, "- <# 주석 #>")
//        webTextView.text = string
    }
    @IBOutlet weak var webLinkBtn: UIButton!
    
  weak var delegate: ViewControllerDelegate? = nil // 리모콘
    
    @IBOutlet weak var linkNameButton: UIButton!
    // 델리게이트 설정
//    var connectCell: ConnectTableViewCell? {
//        didSet {
//            connectCell?.delegate = self
//        }
//    }
    
    
    

    var indexPath: IndexPath? = nil {
        didSet {
                print(#fileID, #function, #line, "- \(indexPath)")
        }
    }
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            print(#fileID, #function, #line, "- <# 주석 #>")
        linkNameButton?.setTitle("링크버튼입니다", for: .normal)
       
    }
    
 
    
    
    @IBAction func trashBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 지우기 버튼이 클릭되었을 때 \(self.indexPath)")
        if let indexPath: IndexPath = indexPath {
            delegate?.deleteLink(indexpath: indexPath)
        }
    }
    
    
}




