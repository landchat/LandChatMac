//
//  LCChattingMessage.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCChattingMessage: NSObject, Codable {
    
    var user: String
    var message: String
    var time: String
    var senderUid: String
    var platform: String?
    var ip: String?
    
    enum CodingKeys: String, CodingKey {
        case user = "usr"
        case message = "msg"
        case time = "time"
        case senderUid = "uid"
        case platform = "app"
        case ip = "ip"
    }

}
