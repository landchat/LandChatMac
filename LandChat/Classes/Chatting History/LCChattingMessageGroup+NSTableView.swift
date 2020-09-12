//
//  LCChattingMessageGroup+NSTableView.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCChatTableCellView: NSTableCellView {
    
    @IBOutlet weak var sender: NSTextField!
    @IBOutlet weak var message: NSTextField!
    
}

extension LCChattingMessageGroup: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return min(250, self.messages!.count)
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {

        let cell = NSTextFieldCell(textCell: "\(self.messages![min(250, self.messages!.count) - row - 1].message)")
        cell.font = NSFont.systemFont(ofSize: 13.0)
        return cell.cellSize(forBounds: NSMakeRect(0, 0, 220, 999999999.0 )).height + 40
        
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var identifier = "A"
        if self.messages![min(250, self.messages!.count) - row - 1].senderUid == UserDefaults.standard.string(forKey: "LoginUserID") {
            identifier = "B"
        }
        if let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: identifier), owner: self) as? LCChatTableCellView {
            view.message.stringValue = self.messages![min(250, self.messages!.count) - row - 1].message
            view.sender.stringValue = self.messages![min(250, self.messages!.count) - row - 1].user + "    " + self.messages![min(250, self.messages!.count) - row - 1].time
            view.rowSizeStyle = .custom
            return view
        }
        return nil
    }
    
    func selectionShouldChange(in tableView: NSTableView) -> Bool {
        return false
    }
    
}
