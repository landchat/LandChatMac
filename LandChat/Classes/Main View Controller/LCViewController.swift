//
//  ViewController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

class LCViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var senderTextView: NSTextView!
    @IBOutlet weak var chattingHistory: NSTableView!
    @IBOutlet weak var titleLabel: NSTextField!
    
    var currentChattingGroup: LCChattingMessageGroup!
    var messageReceiver: LCChattingMessageReceiver!
    
    @objc dynamic var isChatViewHidden = false
    @objc dynamic var isUserViewHidden = true
    
    
    var recentChatrooms = [String]() {
        didSet {
            UserDefaults.standard.set(self.recentChatrooms, forKey: "RecentChatrooms-\(UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown")")
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recentChatrooms = UserDefaults.standard.stringArray(forKey: "RecentChatrooms-\(UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown")") ?? []
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func didClickMoreButton(_ sender: NSButton) {
        let menu = NSMenu(title: "Menu")
        menu.addItem(withTitle: "New Message", action: #selector(newMessage(_:)), keyEquivalent: "")
        menu.addItem(withTitle: "About LandChat", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        menu.popUp(positioning: nil, at: sender.bounds.origin, in: sender)
    }
    
    @IBAction func logOut(_ sender: Any?) {
        let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Login") as! NSWindowController
        vc.showWindow(nil)
        self.view.window?.close()
    }

}

