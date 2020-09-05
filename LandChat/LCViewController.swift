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
    @IBOutlet weak var sendToWhich: NSTextField!
    
    
    static let path = FileManager().urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("LandChat").appendingPathComponent("Recent")
    
    var recentChatRoomNumbers = [String]() {
        didSet {
            NSKeyedArchiver.archiveRootObject(recentChatRoomNumbers, toFile: LCViewController.path.path)
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: LCViewController.path.path) as? [String] {
            self.recentChatRoomNumbers = data
        }
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

