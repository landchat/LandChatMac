//
//  LCLandChatUser.swift
//  LandChat
//
//  Created by 23786 on 2020/9/6.
//

import Cocoa

class LCLandChatUser: NSObject, Codable {
    
    var result: String
    var name: String
    var registerTime: String?
    var email: String?
    var avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
        case name = "name"
        case registerTime = "regitime"
        case email = "email"
        case avatarUrl = "profile_photo"
        
    }
    
    class func user(id: String, completionHandler: @escaping (Bool, LCLandChatUser?) -> Void ) {
        
        let url = URL(string: "https://landchat.ericnth.cn/getuserinfo.php?id=\(id)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if data != nil && error == nil {
                do {
                    completionHandler(true, try JSONDecoder().decode(LCLandChatUser.self, from: data!))
                } catch {
                    completionHandler(false, nil)
                }
            }
            completionHandler(false, nil)
        }
        task.resume()
        
    }
    
}

