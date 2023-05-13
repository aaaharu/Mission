//
//  WebLinkViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/05.
//

import Foundation
import UIKit


protocol WebLinkTableViewCellDelegate: AnyObject {
    func didSelectButton(sender: WebLinkTableViewCell)
}

protocol linkBtnDelegate: AnyObject {
    func didClickedLinkBtn(sender: WebLinkTableViewCell)
}




class WebLinkTableViewCell: UITableViewCell {
    @objc func sendData(string: String) {
        print(#fileID, #function, #line, "- <# 주석 #>")
    }
    @IBOutlet weak var webLinkBtn: UIButton!
    
    @IBOutlet weak var selectBtn: UIButton!
    weak var delegate: ViewControllerDelegate? = nil // 리모콘
    
    weak var celldelegate: WebLinkTableViewCellDelegate?
    
    weak var btnDelegate: linkBtnDelegate?
    
    @IBOutlet weak var linkNameButton: UIButton!
    
    
    weak var vcTableView: UITableView?
    
    
    var indexPath: IndexPath? = nil {
        didSet {
            print(#fileID, #function, #line, "- \(String(describing: indexPath))")
        }
    }
    
    var selectedIndexPaths: [IndexPath] = []
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    // 셀이 재사용될 때 호출, 셀의 상태를 초기화
    override func prepareForReuse() {
        super.prepareForReuse()
    
        selectBtn.isSelected = false
        selectBtn.configuration?.baseForegroundColor = .lightGray
        selectBtn.isEnabled = true
    }
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
    
    
    @IBAction func linkBtnClicked(_ sender: UIButton) {
            print(#fileID, #function, #line, "-  주석 ")
        
        self.btnDelegate?.didClickedLinkBtn(sender: self)
        
        
    }
    
    @IBAction func selectButtonClikced(_ sender: UIButton) {
        print(#fileID, #function, #line, "-  셀렉트버튼 클릭: \(sender.isSelected) 기본값 false")
        // didSelectRowAt에서 선택을 감지하게 하는 코드!!
//        if let tableView = self.superview as? UITableView, let index = tableView.indexPath(for: self) {
//            tableView.delegate?.tableView?(tableView, didSelectRowAt: index)
//            print(#fileID, #function, #line, "- tableView\(tableView)")
//        }
        
        
        // 토글 왔다갔다
        self.selectBtn.isSelected = !self.selectBtn.isSelected
        
        // 지뢰 터짐
        self.celldelegate?.didSelectButton(sender: self)
        
        
//        if sender.configuration?.baseForegroundColor == .systemGreen {
//            sender.configuration?.baseForegroundColor = .lightGray
//            self.selectBtn.isSelected = false
//
//        } else {
//            sender.configuration?.baseForegroundColor = .systemGreen
//            self.selectBtn.isSelected = true
//        }
        
        
        
    }
    
    
    
}
