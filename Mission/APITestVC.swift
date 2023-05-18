//
//  APITestVC.swift
//  Mission
//
//  Created by 김은지 on 2023/05/18.
//

import Foundation
import UIKit

class APITestVC: UIViewController {
    var buttons: [UIButton]!
    
    enum APITYPE: Int {
        case get = 0
        case put = 1
        case delete = 2
        case post = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        buttons.forEach { $0 }.
        
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        print(#fileID, #function, #line, "- \(sender.tag)")
        let btnTag = sender.tag
        
        let btnType: APITYPE = APITYPE(rawValue: btnTag) ?? .get
        
        
        switch btnType {
        case .get:
            print(#fileID, #function, #line, "- <# 주석 #>")
            getApiCall()
        case .put:
            print(#fileID, #function, #line, "- <# 주석 #>")
        case .delete:
            print(#fileID, #function, #line, "- <# 주석 #>")
        case .post:
            print(#fileID, #function, #line, "- <# 주석 #>")
        }
        
        
    }
    
    
    
    //    --header ': ' \
    //    --header 'X-CSRF-TOKEN;'
    
    
    @objc func getApiCall() {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        
        guard  let url = URL(string: "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos?page=1&order_by=desc&per_page=10") else { return }
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
        
        
        
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            print(#fileID, #function, #line, "- data\(data), response \(response), error \(error)")
            
            
            guard  let httpResponse = response as? HTTPURLResponse,
                   let jsonData = data else { return }
            
            do {
                let todoListResponse = try JSONDecoder().decode(TodoListResponse.self, from: jsonData)
                    print(#fileID, #function, #line, "- todoLIstResponse \(todoListResponse)")
            } catch {
                // decoding error
            }
        }
        
        
        dataTask.resume()
    }
    
    
    
    
}



