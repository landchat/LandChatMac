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
        print(url.absoluteString)
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if data != nil && error == nil {
                print("Received \(String(data: data!, encoding: .utf8) ?? "ERROR")")
                do {
                    print("No Error")
                    result( true, try JSONDecoder().decode(LCChattingMessageGroup.self, from: data!) )
                } catch {
                    print("Invalid")
                }
            }
            print("Error")
            result( false, nil )
        }
        task.resume()
        
    }

}
