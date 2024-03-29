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
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.window?.center()
        self.passwordField.stringValue = UserDefaults.standard.string(forKey: "LoginPassword") ?? ""
        self.userID.stringValue = UserDefaults.standard.string(forKey: "LoginUserID") ?? ""
        
    }
    
    @IBAction func login(_ sender: Any?) {
        
        LCLoginRequestResult.isPasswordRight(passwordField.stringValue, uid: Int(userID.stringValue) ?? -1) { (succeed, result) in
            DispatchQueue.main.async {
                if succeed {
                    UserDefaults.standard.set(self.userID.stringValue, forKey: "LoginUserID")
                    if result!.result == "CORRECT" {
                        UserDefaults.standard.set(self.passwordField.stringValue, forKey: "LoginPassword")
                        UserDefaults.standard.set(result!.name, forKey: "UserName")
                        UserDefaults.standard.set(result!.email, forKey: "UserEmail")
                        UserDefaults.standard.set(result!.registerTime, forKey: "UserRegisterTime")
                        UserDefaults.standard.set(result!.avatarUrl, forKey: "UserAvatarUrl")
                        // Succeed
                        print("Welcome, \(result!.name)")
                        DispatchQueue.main.async {
                            let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Main") as! NSWindowController
                            vc.showWindow(nil)
                            self.view.window?.close()
                        }
                    } else {
                        UserDefaults.standard.set("", forKey: "LoginPassword")
                        self.showAlert("Login Failed.", "")
                    }
                } else {
                    UserDefaults.standard.set("", forKey: "LoginPassword")
                    self.showAlert("Login Failed.", "")
                }
            }
        }
        
    }
    
}
