//
//  LCLoginRequestResult.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCLoginRequestResult: NSObject, Codable {
    
    var result: String
    var name: String
    
    static func isPasswordRight(_ password: String, uid: Int, completionHandler: @escaping (Bool, LCLoginRequestResult?) -> (Void) ) {
        
        let url = URL(string: "http://landchat.ericnth.cn/checkkey.php?id=\(uid)&pwd=\(password)")!
        print(url.absoluteString)
        let task = URLSession.shared.dataTask(with: url) { data, result, error in
            if data != nil && error == nil {
                do {
                    completionHandler( true, try JSONDecoder().decode(LCLoginRequestResult.self, from: data!) )
                    return
                } catch {
                    completionHandler( false, nil )
                    return
                }
            }
            completionHandler( false, nil )
        }
        task.resume()
        
    }
    
}
