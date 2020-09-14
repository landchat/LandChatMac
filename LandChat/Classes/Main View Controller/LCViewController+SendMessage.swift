//
//  LCViewController+SendMessage.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

extension LCViewController: LCNewMessageViewControllerDelegate {
    
    @IBAction func sendMessage(_ sender: Any?) {
        
        let message = self.senderTextView.string
        self.senderTextView.string = ""
        let url = URL(string: "http://landchat.ericnth.cn/addmsg.php?id=\(UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown")&room=\(self.recentChatrooms[self.tableView.selectedRow])&msg=\(message)&pwd=\(UserDefaults.standard.string(forKey: "LoginPassword") ?? "")&app_id=mE1aF6cH0jC0jC5pA0lA0cB1kE0cC5".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
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
        
        self.messageReceiver.request()
        
    }
    
    @IBAction func newMessage(_ sender: Any?) {
        self.presentAsSheet( LCNewMessageViewController(delegate: self) )
    }
    
    func newMessageViewControllerSendMessageSucceed(chatroomName: String) {
        self.recentChatrooms.insert(chatroomName, at: 0)
        UserDefaults.standard.setValue(self.recentChatrooms, forKey: "RecentChatrooms")
    }
    
}
