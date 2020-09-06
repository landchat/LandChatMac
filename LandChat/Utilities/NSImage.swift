//
//  NSImage.swift
//  LandChat
//
//  Created by 23786 on 2020/9/6.
//

import Cocoa

extension NSImage {
    
    func resizeImage(to size: NSSize) -> NSImage {
        
        let targetFrame = NSMakeRect(0, 0, size.width, size.height);
        let sourceImageRep = self.bestRepresentation(for: targetFrame, context: nil, hints: nil)
        let targetImage = NSImage(size: size)
        targetImage.lockFocus()
        sourceImageRep?.draw(in: targetFrame)
        targetImage.unlockFocus()

        return targetImage
        
    }
    
}
