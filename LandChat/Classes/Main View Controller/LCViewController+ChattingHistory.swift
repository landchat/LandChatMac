//
//  LCViewController+ChattingHistory.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

extension LCViewController: LCChattingMessageReceiverDelegate {
    
    func messageReceiverReceivedNewMessage(inChatroom room: String, messageGroup: LCChattingMessageGroup) {
        
        DispatchQueue.main.async {
            
            self.currentChattingGroup = messageGroup
            self.chattingHistory.delegate = self.currentChattingGroup
            self.chattingHistory.dataSource = self.currentChattingGroup
            self.chattingHistory.reloadData()
            self.titleLabel.stringValue = room
            self.chattingHistory.enclosingScrollView?.scroll(
                self.chattingHistory.enclosingScrollView!.contentView,
                to: NSMakePoint(0,
                    self.chattingHistory.bounds.height -
                    self.chattingHistory.enclosingScrollView!.bounds.height
                )
            )
            
        }
        
        
    }
    
    func loadMessageGroup(ofName name: String) {
        
        self.messageReceiver.chatroomName = name
        /*
        LCChattingMessageGroup.messageGroup(ofName: "\(name)") {
            (bool, result) in
            DispatchQueue.main.async {
                if bool {
                    if result!.messages != nil {
                        self.currentChattingGroup = result!
                        self.chattingHistory.dataSource = self.currentChattingGroup
                        self.chattingHistory.delegate = self.currentChattingGroup
                        self.chattingHistory.reloadData()
                        self.titleLabel.stringValue = name
                        self.chattingHistory.enclosingScrollView?.scroll(
                            self.chattingHistory.enclosingScrollView!.contentView,
                            to: NSMakePoint(0,
                                self.chattingHistory.bounds.height -
                                self.chattingHistory.enclosingScrollView!.bounds.height
                            )
                        )
                    } else {
                        self.showAlert("Error", "No such chatting group.")
                    }
                } else {
                    self.showAlert("Error", "No such chatting group.")
                }
            }
        }
        */
    }
    
    @IBAction func didClickTableView(_ sender: Any?) {
        
        guard self.tableView.clickedRow >= 0 else {
            return
        }
        
        let clickedRow = self.tableView.clickedRow
        self.loadMessageGroup(ofName: self.recentChatrooms[clickedRow])
        
    }
    
}
