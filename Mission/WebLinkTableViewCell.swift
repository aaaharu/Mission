//
//  WebLinkViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/05.
//

import Foundation
import UIKit

protocol ButtonDelegate: AnyObject {
    func buttonDidTap()
}


class WebLinkTableViewCell: UITableViewCell {
    @objc func sendData(string: String) {
        print(#fileID, #function, #line, "- <# 주석 #>")
    }
    @IBOutlet weak var webLinkBtn: UIButton!
    
    @IBOutlet weak var selectBtn: UIButton!
    weak var delegate: ViewControllerDelegate? = nil // 리모콘
    
    
    @IBOutlet weak var linkNameButton: UIButton!
    
   
    weak var vcTableView: UITableView?
    
    
    var indexPath: IndexPath? = nil {
        didSet {
            print(#fileID, #function, #line, "- \(String(describing: indexPath))")
        }
    }
    
    var selectedIndexPaths: [IndexPath] = []
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- <# 주석 #>")
        linkNameButton?.setTitle("링크버튼입니다", for: .normal)
        
    }
    
    
    
    @IBAction func trashBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 지우기 버튼이 클릭되었을 때 \(String(describing: self.indexPath))")
        if let indexPath: IndexPath = indexPath {
            delegate?.deleteLink(indexpath: indexPath)
        }
    }
    
    
    @IBAction func selectClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "-  셀렉트버튼 클릭: \(sender.isSelected) 기본값 false")
        // didSelectRowAt에서 선택을 감지하게 하는 코드!!
        if let tableView = self.superview as? UITableView, let index = tableView.indexPath(for: self) {
            tableView.delegate?.tableView?(tableView, didSelectRowAt: index)
            print(#fileID, #function, #line, "- tableView\(tableView)")
        }
        
       
        
        
    }
    
    
    
    
    
}




