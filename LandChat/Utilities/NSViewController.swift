//
//  NSViewController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

extension NSViewController {
    
    func showAlert(_ title: String, _ message: String) {
        
        guard self.view.window != nil else {
            return
        }
   
        let alert = NSAlert()
        alert.messageText = title
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        alert.informativeText = message
        alert.beginSheetModal(for: self.view.window!, completionHandler: { returnCode in })
        
    }
    
}
