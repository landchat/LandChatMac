//
//  LCChattingMessageReceiver.swift
//  LandChat
//
//  Created by 23786 on 2020/9/12.
//

import Cocoa

protocol LCChattingMessageReceiverDelegate {
    func messageReceiverReceivedNewMessage(inChatroom: String, messageGroup: LCChattingMessageGroup)
}

class LCChattingMessageReceiver: NSObject {
    
    var chatroomName: String
    var queue: DispatchQueue?
    var delegate: LCChattingMessageReceiverDelegate?
    var historyResult: LCChattingMessageGroup?
    var timer: Timer?
    
    init(chatroomName: String) {
        self.chatroomName = chatroomName
        self.queue = DispatchQueue(label: "LandChatMessageReceiver-\(chatroomName)", qos: .background)
        super.init()
    }
    
    func validate() {
        
        self.timer = Timer(fire: Date(), interval: 1.0, repeats: true, block: { (timer) in
            
            LCChattingMessageGroup.messageGroup(ofName: self.chatroomName) {
                (bool, result) in
                guard bool else {
                    return
                }
                guard result!.messages != nil else {
                    return
                }
                self.queue?.async {
                    if self.historyResult != nil {
                        if result!.messages != self.historyResult!.messages {
                            self.historyResult = result
                            self.delegate?.messageReceiverReceivedNewMessage(inChatroom: self.chatroomName, messageGroup: result!)
                        }
                    } else {
                        self.historyResult = result
                        self.delegate?.messageReceiverReceivedNewMessage(inChatroom: self.chatroomName, messageGroup: result!)
                    }
                }
            }
            
        })
        
        queue?.sync {
            RunLoop.current.add(self.timer!, forMode: .common)
        }
        
    }
    
    func invalidate() {
        
        self.timer?.invalidate()
        
    }
    
    deinit {
        
        self.invalidate()
        
    }
    
}
