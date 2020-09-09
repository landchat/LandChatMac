//
//  LCLoginViewController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/9.
//

import Cocoa

class LCLoginViewController: NSViewController {
    
    @IBOutlet weak var userID: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any?) {
        LCLoginRequestResult.isPasswordRight(passwordField.stringValue, uid: Int(userID.stringValue) ?? -1) { (succeed, result) in
            if succeed {
                if result!.result == "CORRECT" {
                    // Succeed
                    print("Welcome, \(result!.name)")
                    DispatchQueue.main.async {
                        let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Main") as! NSWindowController
                        vc.showWindow(nil)
                    }
                } else {
                    self.showAlert("Login Failed.", "")
                }
            } else {
                self.showAlert("Login Failed.", "")
            }
        }
    }
    
}
