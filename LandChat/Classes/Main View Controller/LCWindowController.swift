//
//  LCWindowController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/12.
//

import Cocoa

class LCWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        if (self.contentViewController as! LCViewController).recentChatrooms.count == 0 {
            self.contentViewController?.showAlert("Welcome to LandChat!", "Click the \"+\" button on the top, choose \"Send Message\" to send your first message in LandChat!")
        }
        
    }
    
}
