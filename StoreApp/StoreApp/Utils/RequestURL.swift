//
//  Request.swift
//  StoreApp
//
//  Created by 이준형 on 2021/02/02.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import Toaster

class RequestURL {
    func requestDownloadURL(){
        for iter in JsonFileName.jsonFileName {
            guard let url = URL(string: "http://public.codesquad.kr/jk/kakao-2021/\(iter.rawValue).json") else { return }
            
            SectionHeader.headerTitle.append(iter.rawValue)
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.decoding(iter: iter, data: data)
                }
            }.resume()
        }
    }
    
    func decoding(iter: JsonFileName, data : Data){
        do {
            if let decodeData = try? JSONDecoder().decode([Item].self, from : data){
                let userInfo: [AnyHashable: Any] = [iter.rawValue:decodeData]
                NotificationCenter.default.post(name: NSNotification.Name("saveItem"), object: self, userInfo: userInfo)
            }
        } catch {
            let str = "\(iter.rawValue).json 을 읽어올 수 없습니다."
            let userInfo: [AnyHashable: Any] = [iter.rawValue:str]
            NotificationCenter.default.post(name: NSNotification.Name("showToast"), object: self, userInfo: userInfo)
        }
    }
    
}
