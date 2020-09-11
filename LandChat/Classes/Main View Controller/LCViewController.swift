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
    
    var currentChattingGroup: LCChattingMessageGroup!
    
    @objc dynamic var isChatViewHidden = false
    @objc dynamic var isUserViewHidden = true
    
    
    var recentChatRoomNumbers = [String]() {
        didSet {
            UserDefaults.standard.set(self.recentChatRoomNumbers, forKey: "RecentChatrooms")
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recentChatRoomNumbers = UserDefaults.standard.stringArray(forKey: "RecentChatrooms") ?? []
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

