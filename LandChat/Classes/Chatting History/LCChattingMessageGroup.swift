//
//  LCChattingMessageGroup.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCChattingMessageGroup: NSObject, Codable {
    
    var messages: [LCChattingMessage]?
    
    class func messageGroup(ofName name: String, flushTime time: String, result: @escaping (Bool, LCChattingMessageGroup?) -> (Void) ) {
        
        let url = URL(string: "https://landchat.ericnth.cn/viewjson.php?room=\(name)&flushtime=\(time)")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if data != nil && error == nil {
                if let string = String(data: data!, encoding: .utf8) {
                    if string == "Nothing-New" {
                        result( true, nil )
                        return
                    }
                }
                do {
                    result( true, try JSONDecoder().decode(LCChattingMessageGroup.self, from: data!) )
                    return
                } catch {
                    result( false, nil )
                    return
                }
            }
            result( false, nil )
        }
        task.resume()
        
    }

}
