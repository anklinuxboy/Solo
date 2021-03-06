//
//  SoloSetGame.swift
//  PlaySolo
//
//  Created by Ankit Sharma on 7/18/21.
//

import Foundation

class SoloSetGame: ObservableObject {
  typealias Card = SetGame.Card
  
  @Published private(set) var game: SetGame
  
  init() {
    game = SetGame()
  }
  
  func choose(_ card: Card) {
    game.choose(card)
  }
  
  var cards: [Card] {
    return game.cards
  }
}
