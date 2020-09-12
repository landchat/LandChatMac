//
//  LCChattingMessageGroup.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCChattingMessageGroup: NSObject, Codable {
    
    var messages: [LCChattingMessage]?
    
    class func messageGroup(ofName name: String, result: @escaping (Bool, LCChattingMessageGroup?) -> (Void) ) {
        
        let url = URL(string: "http://landchat.ericnth.cn/viewjson.php?room=\(name)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if data != nil && error == nil {
                do {
                    result( true, try JSONDecoder().decode(LCChattingMessageGroup.self, from: data!) )
                    return
                } catch {
                    return
                }
            }
            result( false, nil )
        }
        task.resume()
        
    }

}
