//
//  LCViewController+SendMessage.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

extension LCViewController {
    
    @IBAction func sendMessage(_ sender: Any?) {
        
        let message = self.senderTextView.string
        self.senderTextView.string = ""
        let url = URL(string: "http://landchat.ericnth.cn/addmsg.php?usr=\("LandChatMacTest")&room=\(self.sendToWhich.stringValue)&msg=\(message)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error == nil && data != nil {
                if let res = String(data: data!, encoding: .utf8) {
                    if res != "Succeed" {
                        print("Error")
                    }
                } else {
                    print("Error")
                }
            } else {
                print("Error")
            }
        }
        task.resume()
        
        self.recentChatRoomNumbers.insert(self.sendToWhich.stringValue, at: 0)
        
    }
    
}
