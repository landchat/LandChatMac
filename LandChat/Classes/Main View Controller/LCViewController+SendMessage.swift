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
        let url = URL(string: "http://landchat.ericnth.cn/addmsg.php?id=\(UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown")&room=\(self.recentChatRoomNumbers[self.tableView.selectedRow - 1])&msg=\(message)&pwd=\(UserDefaults.standard.string(forKey: "LoginPassword") ?? "")&app_id=mE1aF6cH0jC0jC5pA0lA0cB1kE0cC5".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error == nil && data != nil {
                if let res = String(data: data!, encoding: .utf8) {
                    if res != "Succeed" {
                        self.showAlert("Send Message Failed.", res)
                    }
                } else {
                    self.showAlert("Send Message Failed.", "")
                }
            } else {
                self.showAlert("Send Message Failed.", "")
            }
        }
        task.resume()
        /*let url = URL(string: "http://landchat.ericnth.cn/addmsg.php?usr=\(LCLandChatUser.current?.nickname ?? "UnknownUser")&room=\(self.sendToWhich.stringValue)&msg=\(message)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
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
        
        if self.tableView.selectedRow >= 1 {
            self.recentChatRoomNumbers.remove(at: self.tableView.selectedRow - 1)
        } else {
            if self.recentChatRoomNumbers.contains(self.sendToWhich.stringValue) {
                self.recentChatRoomNumbers.remove(at: self.recentChatRoomNumbers.firstIndex(of: self.sendToWhich.stringValue)!)
            }
        }
        self.recentChatRoomNumbers.insert(self.sendToWhich.stringValue, at: 0)
        self.tableView?.selectRowIndexes(IndexSet(arrayLiteral: 1), byExtendingSelection: false)
        */
    }
    
}
