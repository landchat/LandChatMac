//
//  LCViewController+ChattingHistory.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

extension LCViewController {
    
    @IBAction func didClickTableView(_ sender: Any?) {
        
        guard self.tableView.clickedRow >= 1 else {
            self.sendToLabel.isHidden = false
            self.sendToWhich.isHidden = false
            return
        }
    
        self.sendToLabel.isHidden = true
        self.sendToWhich.isHidden = true
        self.sendToWhich.stringValue = self.recentChatRoomNumbers[self.tableView.clickedRow - 1]
        let url = URL(string: "http://landchat.ericnth.cn/chatdata/room\(self.recentChatRoomNumbers[self.tableView.clickedRow - 1]).txt")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error == nil && data != nil {
                if let res = String(data: data!, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.chattingHistory.string = res
                    }
                } else {
                    print("Error")
                }
            } else {
                print("Error")
            }
        }
        task.resume()
        
    }
    
}
