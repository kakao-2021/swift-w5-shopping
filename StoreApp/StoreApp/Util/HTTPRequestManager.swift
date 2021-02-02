//
//  HTTPRequestManager.swift
//  StoreApp
//
//  Created by Hochang Lee on 2021/02/01.
//

import Foundation

class HTTPRequestManager {
    
    static func getJsonData(itemType : ItemManager.ItemType, completionHandler : @escaping ([StoreItem]) -> Void) {
        let session = URLSession.shared
        guard let dataURL = URL(string: "http://public.codesquad.kr/jk/kakao-2021/\(itemType.rawValue).json") else { return }
        session.dataTask(with: dataURL) {
            data, response, error in
            guard error == nil else {
                return
            }
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let resultArray : [StoreItem] = try JSONDecoder().decode([StoreItem].self, from: data)
                    completionHandler(resultArray)
                } catch(let error) {
                    print(error)
                }
            }
        }.resume()
    }
    
    static func getImageUsingURLString(urlString : String, completionHandler : @escaping (Data) -> Void) {
        guard let imageURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: imageURL) {
            data, response, error in
            guard error == nil else {
                return
            }
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                completionHandler(data)
            }
        }.resume()
    }
}
