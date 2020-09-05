//
//  AppDelegate.swift
//  LandChat
//
//  Created by 23786 on 2020/9/5.
//

import Cocoa

@NSApplicationMain
class LCAppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let url = FileManager().urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("LandChat")
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager().createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                
            }
        }
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

