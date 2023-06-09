//
//  ConnectTableViewCell.swift
//  Mission
//
//  Created by 김은지 on 2023/05/07.
//

import Foundation
import UIKit

protocol SendData {
    func sendData(string: String)
}

//UITextFieldDelegate
class ConnectTableViewCell:UITableViewCell {
    
    
    var didChangeLinkText: ((IndexPath, String) -> ())? = nil
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var myTextField: UITextField!
    
    var indexPath: IndexPath? = nil
    
    @IBOutlet weak var trashBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        //        myTextField.delegate = self
        myTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
//        trashBtn.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        
    }
    @objc func didChangeText(inputTextField: UITextField) {
        
        print(#fileID, #function, #line, "- \(indexPath),\(String(describing: inputTextField.text))")
        
        
        if let indexPath: IndexPath = self.indexPath,
           let inputText: String = inputTextField.text {
            
            self.didChangeLinkText?(indexPath, inputText)
        }
    }
    
//    @objc func deleteCell(_ sender: UIButton) {
//   
//        if let indexPath: IndexPath = self.indexPath {
//            self.showingDeleteConfirmation 
//            print(#fileID, #function, #line, "- 지우기 버튼이 눌렸습니다 \(indexPath)" )
//        }
//    }
    
    func deleteCellRemote(indexPath: IndexPath) {
        
    }
    
    func setupUI() {
        print(#fileID, #function, #line, "- <# 주석 #>")
        myTextField.placeholder = "SNS 또는 홈페이지를 연결해주세요."
    }
    
    // textfield 값이 변경될 때마다 호출되는 메서드
    //     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //         // 변경된 값과 현재 값 합치기
    //         let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
    //
    //
    //         return true
    //     }
    
}
