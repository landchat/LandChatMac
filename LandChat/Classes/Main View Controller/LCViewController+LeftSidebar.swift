//
//  LCViewController+LeftSidebar.swift
//  LandChat
//
//  Created by 23786 on 2020/9/6.
//

import Cocoa

extension LCViewController {
    
    @IBAction func chatButtonClicked(_ sender: Any?) {
        
        self.isChatViewHidden = false
        self.isUserViewHidden = true
        
    }
    
    @IBAction func userButtonClicked(_ sender: Any?) {
        
        self.isChatViewHidden = true
        self.isUserViewHidden = false
        
    }
    
}
