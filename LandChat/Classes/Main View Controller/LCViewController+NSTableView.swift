//
//  LCViewController+NSTableView.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

class LCTableChatroomCellView: NSTableCellView {
    
    @IBOutlet weak var recentMessageLabel: NSTextField!
    
}

extension LCViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.recentChatRoomNumbers.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("Item"), owner: self) as? LCTableChatroomCellView {
            let label = NSTextField(labelWithString: "\(self.recentChatRoomNumbers[row - 1])")
            label.drawsBackground = true
            label.textColor = .black
            label.backgroundColor = .white
            let imageData = label.dataWithPDF(inside: label.bounds)
            view.imageView?.image = NSImage(data: imageData)
            // view.imageView?.wantsLayer = true
            view.imageView?.layer?.backgroundColor = .white
            view.imageView?.setNeedsDisplay()
            view.textField?.stringValue = "Chatroom \(self.recentChatRoomNumbers[row - 1])"
            view.recentMessageLabel?.stringValue = "Test"
            return view
        }
        return nil
    }
    
}
