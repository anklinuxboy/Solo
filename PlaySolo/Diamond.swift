//
//  Oval.swift
//  PlaySolo
//
//  Created by Ankit Sharma on 7/17/21.
//

import SwiftUI

struct Diamond: Shape {
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let len = min(rect.width, rect.height) * DiamondConst.scale
    
    let diamondLen = len / 2
    
    let diamondTopPt = CGPoint(x: rect.midX, y: rect.midY - diamondLen)
    let diamondLeftPt = CGPoint(x: rect.midX - diamondLen, y: rect.midY)
    let diamondBottomPt = CGPoint(x: rect.midX, y: rect.midY + diamondLen)
    let diamondRightPt = CGPoint(x: rect.midX + diamondLen, y: rect.midY)
    
    path.move(to: diamondTopPt)
    path.addLine(to: diamondLeftPt)
    path.addLine(to: diamondBottomPt)
    path.addLine(to: diamondRightPt)
    path.addLine(to: diamondTopPt)
    path.closeSubpath()
    
    return path
  }
  
  struct DiamondConst {
    static let scale: CGFloat = 0.8
  }
}
