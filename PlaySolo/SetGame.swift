//
//  SetGame.swift
//  PlaySolo
//
//  Created by Ankit Sharma on 7/18/21.
//

import Foundation

struct SetGame {
  
  private(set) var cards: [Card] = []
  
  init() {
    for shape in Shape.allCases {
      for size in Size.allCases {
        for color in Color.allCases {
          for shading in Shading.allCases {
            let card = Card(id: cards.count + 1, color: color, shape: shape, size: size, shading: shading)
            cards.append(card)
          }
        }
      }
    }
    
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    var id: Int
    var isMatched = false
    var selected = false
    let color: Color
    let shape: Shape
    let size: Size
    let shading: Shading
  }
  
  enum Shape: CaseIterable {
    case rect
    case diamond
    case circle
  }

  enum Size: CaseIterable {
    case one
    case two
    case three
  }

  enum Color: CaseIterable {
    case red
    case green
    case purple
  }

  enum Shading: CaseIterable {
    case outline
    case striped
    case filled
  }
}
