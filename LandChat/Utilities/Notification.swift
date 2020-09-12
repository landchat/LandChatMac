//
//  Notification.swift
//  LandChat
//
//  Created by 23786 on 2020/9/12.
//

import Cocoa

extension NSObject: NSUserNotificationCenterDelegate {
    
    func sendUserNotification(title: String, subtitle: String) {
        let userNotification = NSUserNotification()
        userNotification.title = title
        userNotification.subtitle = subtitle
        userNotification.informativeText = ""
        let userNotificationCenter = NSUserNotificationCenter.default
        userNotificationCenter.delegate = self
        userNotificationCenter.scheduleNotification(userNotification)
    }
    
    public func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool{
        return true
    }
    
}

