//
//  ContentView.swift
//  PlaySolo
//
//  Created by Ankit Sharma on 7/17/21.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var game: SoloSetGame
  
  var body: some View {
    ScrollView {
      AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
        CardView(card: card)
          .padding(6)
          .onTapGesture {
            game.choose(card)
          }
      })
    }
  }
}

struct CardView: View {
  let card: SetGame.Card
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 10.0)
      if card.selected {
        shape.foregroundColor(Color.gray)
          .opacity(0.2)
      } else {
        shape.stroke(lineWidth: 2.0)
          .foregroundColor(Color.black)
      }
      numberOfViews(card: card)
        .padding(6)
    }
  }
  
  @ViewBuilder
  private func numberOfViews(card: SetGame.Card) -> some View {
    let shape = shape(card: card).foregroundColor(color(card: card))
    switch card.size {
    case .one:
      shape
    case .two:
      VStack {
        shape
        shape
      }
    case .three:
      VStack {
        shape
        shape
        shape
      }
    }
  }
  
  private func color(card: SetGame.Card) -> Color {
    switch card.color {
    case .green:
      return Color.green
    case .red:
      return Color.red
    case .purple:
      return Color.purple
    }
  }
  
  @ViewBuilder
  private func shape(card: SetGame.Card) -> some View {
    switch card.shape {
    case .circle:
      switch card.shading {
      case .outline:
        Circle()
          .strokeBorder(lineWidth: 2.0)
      case .striped:
        Circle()
          .opacity(0.5)
      case .filled:
        Circle()
      }
    case .diamond:
      switch card.shading {
      case .outline:
        Diamond()
          .stroke()
      case .striped:
        Diamond()
          .opacity(0.5)
      case .filled:
        Diamond()
      }
    case .rect:
      switch card.shading {
      case .outline:
        RoundedRectangle(cornerRadius: 20.0)
          .strokeBorder(lineWidth: 2.0)
      case .striped:
        RoundedRectangle(cornerRadius: 20.0)
          .opacity(0.5)
      case .filled:
        RoundedRectangle(cornerRadius: 20.0)
      }
    }
  }
}





























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = SoloSetGame()
    ContentView(game: game)
  }
}
