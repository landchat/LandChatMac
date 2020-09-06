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
            LCLandChatUser.setNickname( self.nameTextField.stringValue )
            LCLandChatUser.setAvatar( self.avatarImage.image ?? NSImage() )
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
        
        self.nameTextField.stringValue = LCLandChatUser.current?.nickname ?? "UnknownUser"
        self.avatarImage.image = LCLandChatUser.current?.avatar
        
    }
    
}
