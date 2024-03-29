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
    var registerTime: String
    var email: String
    var avatarUrl: String
    
    static func isPasswordRight(_ password: String, uid: Int, completionHandler: @escaping (Bool, LCLoginRequestResult?) -> (Void) ) {
        
        let url = URL(string: "https://landchat.ericnth.cn/checkkey.php?id=\(uid)&pwd=\(password)")!
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
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
        case name = "name"
        case registerTime = "regitime"
        case email = "email"
        case avatarUrl = "profile_photo"
        
    }
    
}
