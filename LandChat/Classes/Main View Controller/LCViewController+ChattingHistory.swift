//
//  LCViewController+ChattingHistory.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

extension LCViewController {
    
    @IBAction func didClickTableView(_ sender: Any?) {
        
        guard self.tableView.clickedRow >= 0 else {
            return
        }
        
        let clickedRow = self.tableView.clickedRow
        
        LCChattingMessageGroup.messageGroup(ofName: "\(self.recentChatrooms[clickedRow])") {
            (bool, result) in
            DispatchQueue.main.async {
                if bool {
                    if result!.messages != nil {
                        self.currentChattingGroup = result!
                        self.chattingHistory.dataSource = self.currentChattingGroup
                        self.chattingHistory.delegate = self.currentChattingGroup
                        self.chattingHistory.reloadData()
                        self.titleLabel.stringValue = self.recentChatrooms[clickedRow]
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
        
    }
    
}
