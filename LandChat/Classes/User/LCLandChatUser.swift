//
//  LCLandChatUser.swift
//  LandChat
//
//  Created by 23786 on 2020/9/6.
//

import Cocoa

class LCLandChatUser: NSObject, NSCoding {
    
    static let path = FileManager().urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("LandChat").appendingPathComponent("UserData")
    
    var nickname = "UnknownUser"
    // var id: Int = -1
    var avatar: NSImage = NSImage()
    
    func encode(with coder: NSCoder) {
        coder.encode(self.nickname, forKey: "NICKNAME")
        coder.encode(self.avatar, forKey: "AVATAR")
    }
    
    init(nickname: String?, avatar: NSImage?) {
        super.init()
        self.nickname = nickname ?? "UnknownUser"
        self.avatar = avatar ?? NSImage()
    }
    
    required init?(coder: NSCoder) {
        self.nickname = coder.decodeObject(forKey: "NICKNAME") as! String
        self.avatar = coder.decodeObject(forKey: "AVATAR") as! NSImage
    }
    
    class var current: LCLandChatUser? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: LCLandChatUser.path.path) as? LCLandChatUser
    }
    
    class func setNickname(_ newName: String) {
        NSKeyedArchiver.archiveRootObject(LCLandChatUser(nickname: newName, avatar: LCLandChatUser.current?.avatar), toFile: LCLandChatUser.path.path)
    }
    
    class func setAvatar(_ newAvatar: NSImage) {
        NSKeyedArchiver.archiveRootObject(LCLandChatUser(nickname: LCLandChatUser.current?.nickname, avatar: newAvatar), toFile: LCLandChatUser.path.path)
    }
    
}
