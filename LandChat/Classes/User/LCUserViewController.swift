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
    @objc dynamic var isEditing = false
    
    @IBAction func editOrDone(_ sender: NSButton?) {
        self.isEditing = !isEditing
        if self.isEditing {
            self.nameTextField.isEditable = true
            self.nameTextField.becomeFirstResponder()
            sender?.title = "Done"
        } else {
            self.nameTextField.resignFirstResponder()
            self.nameTextField.isEditable = false
            // yUserDefaults.standard.set( self.nameTextField.stringValue, forKey: "UserNickName" )
            sender?.title = "Edit"
        }
    }
    
    @IBAction func chooseImage(_ sender: Any?) {
        let panel = NSOpenPanel()
        panel.allowedFileTypes = ["jpg", "jpeg", "png"]
        panel.beginSheetModal(for: self.view.window!) { response in
            if response == .OK && panel.url != nil {
                self.avatarImage.image = NSImage(contentsOf: panel.url!)?
                    .resizeImage(to: NSMakeSize(150, 150))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.stringValue = UserDefaults.standard.string(forKey: "UserName") ?? "Unknown User"
        self.uidLabel.stringValue = "LandChat User ID: " + ( UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown" )
        
    }
    
}
