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
        return self.recentChatrooms.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("Item"), owner: self) as? LCTableChatroomCellView {
            let label = NSTextField(labelWithString: "\(self.recentChatrooms[row])")
            label.drawsBackground = true
            label.textColor = .black
            label.backgroundColor = .white
            let imageData = label.dataWithPDF(inside: label.bounds)
            view.imageView?.image = NSImage(data: imageData)
            // view.imageView?.wantsLayer = true
            view.imageView?.layer?.backgroundColor = .white
            view.imageView?.setNeedsDisplay()
            view.textField?.stringValue = self.recentChatrooms[row]
            view.recentMessageLabel?.stringValue = ""
            return view
        }
        return nil
    }
    
    @IBAction func delete(_ sender: Any?) {
        guard self.tableView.clickedRow >= 0 else {
            return
        }
        self.recentChatrooms.remove(at: self.tableView.clickedRow)
        UserDefaults.standard.setValue(self.recentChatrooms, forKey: "RecentChatrooms")
    }
    
}
