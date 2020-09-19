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
    
    var chatroomName: String {
        didSet {
            self.lastFlushTime = "100001010001"
        }
    }
    
    var queue: DispatchQueue?
    var delegate: LCChattingMessageReceiverDelegate?
    var timer: Timer?
    var lastFlushTime: String = "100001010001"
    
    init(chatroomName: String) {
        self.chatroomName = chatroomName
        self.queue = DispatchQueue(label: "LandChatMessageReceiver-\(chatroomName)", qos: .background)
        super.init()
    }
    
    func validate() {
        
        self.timer = Timer(fire: Date(), interval: 1.0, repeats: true, block: { (timer) in
            
            self.request()
            
        })
        
        queue?.sync {
            RunLoop.current.add(self.timer!, forMode: .common)
        }
        
    }
    
    func request() {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmm"
        let string = dateFormatter.string(from: date)
        print(string)
        let lastFlushTime = self.lastFlushTime
        self.lastFlushTime = string
        
        LCChattingMessageGroup.messageGroup(ofName: self.chatroomName, flushTime: lastFlushTime) {
            (bool, result) in
            guard bool else {
                return
            }
            guard result != nil else {
                return
            }
            guard result!.messages != nil else {
                return
            }
            self.queue?.async {
                self.delegate?.messageReceiverReceivedNewMessage(inChatroom: self.chatroomName, messageGroup: result!)
            }
        }
        
    }
    
    func invalidate() {
        
        self.timer?.invalidate()
        
    }
    
    deinit {
        
        self.invalidate()
        
    }
    
}
