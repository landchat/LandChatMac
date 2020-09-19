//
//  LCUserViewController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/6.
//

import Cocoa

class LCUserViewController: NSViewController {
    
    @IBOutlet weak var avatarImage: NSImageView!
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var uidLabel: NSTextField!
    @IBOutlet weak var emailLabel: NSTextField!
    @IBOutlet weak var avatarUrlLabel: NSTextField!
    @objc dynamic var isEditing = false
    
    @IBAction func editOrDone(_ sender: NSButton?) {
        self.isEditing = !isEditing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.stringValue = "Welcome, " + ( UserDefaults.standard.string(forKey: "UserName") ?? "Unknown User" )
        self.uidLabel.stringValue = UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown"
        self.emailLabel.stringValue = UserDefaults.standard.string(forKey: "UserEmail") ?? "Unknown"
        self.avatarUrlLabel.stringValue = UserDefaults.standard.string(forKey: "UserAvatarUrl") ?? "Unknown"
        
    }
    
}
