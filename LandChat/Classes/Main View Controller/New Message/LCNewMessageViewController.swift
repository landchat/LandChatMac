//
//  LCNewMessageViewController.swift
//  LandChat
//
//  Created by 23786 on 2020/9/11.
//

import Cocoa

protocol LCNewMessageViewControllerDelegate {
    func newMessageViewControllerSendMessageSucceed(chatroomName: String)
}

class LCNewMessageViewController: NSViewController {
    
    convenience init(delegate: LCNewMessageViewControllerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    @IBOutlet weak var chatroomName: NSTextField!
    @IBOutlet weak var message: NSTextView!
    var delegate: LCNewMessageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func sendMessage(_ sender: Any?) {
        
        let url = URL(string: "https://landchat.ericnth.cn/addmsg.php?id=\(UserDefaults.standard.string(forKey: "LoginUserID") ?? "Unknown")&room=\(self.chatroomName.stringValue)&msg=\(self.message.string)&pwd=\(UserDefaults.standard.string(forKey: "LoginPassword") ?? "")&app_id=mE1aF6cH0jC0jC5pA0lA0cB1kE0cC5".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            DispatchQueue.main.async {
                
                if error == nil && data != nil {
                    if let res = String(data: data!, encoding: .utf8) {
                        if res != "Succeed" {
                            self.showAlert("Send Message Failed.", res)
                        } else {
                            self.delegate?.newMessageViewControllerSendMessageSucceed(chatroomName: self.chatroomName.stringValue)
                        }
                    } else {
                        self.showAlert("Send Message Failed.", "")
                    }
                } else {
                    self.showAlert("Send Message Failed.", "")
                }
                
                self.dismiss(nil)
                
            }
        }
        task.resume()
        
    }
    
}
