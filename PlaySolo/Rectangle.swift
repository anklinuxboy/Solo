//
//  Rectangle.swift
//  PlaySolo
//
//  Created by Ankit Sharma on 7/17/21.
//

import SwiftUI

struct Rectangle: View {
  
  var body: some View {
    GeometryReader { geometry in
      let size = min(geometry.size.width, geometry.size.height)
      RoundedRectangle(cornerRadius: 20.0)
        .frame(width: size, height: size / 2)
    }
  }
}


