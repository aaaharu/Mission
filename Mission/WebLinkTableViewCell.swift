//
//  WebLinkViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/05.
//

import Foundation
import UIKit

class WebLinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var webTextFiled: UITextView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            print(#fileID, #function, #line, "- <# 주석 #>")
        
    }
    
    
    @IBAction func trashBtnClicked(_ sender: UIButton) {
            print(#fileID, #function, #line, "- 지우기 버튼이 클릭되었을 때")
        mainView.delete(mainView)
        webTextFiled.delete(webTextFiled)
        deleteButton.delete(deleteButton)
        
    }
    
    
}


