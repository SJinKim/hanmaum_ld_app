//
//  ScrollingCarouselView.swift
//  HanmaumChurchApp
//
//  Created by SeungJin Kim on 14.06.24.
//

import SwiftUI

struct ScrollingCarouselView: View {
    let cards =  [Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card()]
    let widthScale = 0.75
    let cardAspectRatio = 1.5
    
    @State private var screenWidth: CGFloat = 0
    @State private var cardHeight: CGFloat = 0
    @State var dragOffset: CGFloat = 0
    @State var activeCardIndex = 0
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                ForEach(cards.indices, id: \.self) { index in
                    VStack {
                        // list for each loop over news
                        Text(cards[index].news[index % cards.count])
                    }
                    .frame(width: screenWidth * widthScale, height: cardHeight)
                    .background(cards[index].colors[index % cards.count])
                    .overlay(Color.white.opacity(1-cardScale(for: index, proportion: 0.25)))
                    .cornerRadius(20)
                    .offset(x: cardOffset(for: index))
                    .scaleEffect(x: cardScale(for: index), y: cardScale(for: index))
                    .zIndex(-Double(index))
                    .gesture(
                        DragGesture().onChanged{ value in
                        
                        }.onEnded{ value in
                            let threshold = screenWidth * 0.2
                            
                            withAnimation {
                                if value.translation.width < -threshold {
                                    activeCardIndex = min(activeCardIndex + 1, cards.count - 1)
                                } else if
                                    value.translation.width > threshold {
                                    activeCardIndex = max(activeCardIndex - 1, 0)
                                }
                            }
                            
                            withAnimation {
                                dragOffset = 0
                            }
                        }
                    )
                }
            }
            .onAppear{
                screenWidth = reader.size.width
                cardHeight = screenWidth * widthScale * cardAspectRatio
            }
            .offset(x: 16)
        }
    }
    
    // calc offset
    func cardOffset(for index: Int) -> CGFloat {
        let adjustedIndex = index - activeCardIndex
        let cardSpacing: CGFloat = 60 / cardScale(for: index)
        let initialOffset = cardSpacing * CGFloat(adjustedIndex)
        let progress = min(abs(dragOffset)/(screenWidth/2), 1)
        let maxCardMovement = cardSpacing
        
        if adjustedIndex < 0 {
            if dragOffset > 0 && index == activeCardIndex - 1 {
                let distanceToMove = (initialOffset + screenWidth) * progress
                return -screenWidth + distanceToMove
            } else {
                return -screenWidth
            }
        } else if index > activeCardIndex {
            let distanceToMove = progress * maxCardMovement
            return initialOffset - (dragOffset < 0 ? distanceToMove : -distanceToMove)
        } else {
            if dragOffset < 0 {
                return dragOffset
            } else {
                let distanceToMove = maxCardMovement * progress
                return initialOffset - (dragOffset < 0 ? distanceToMove : -distanceToMove)
            }
        }
    }
    
    func cardScale(for index: Int, proportion: CGFloat = 0.2) -> CGFloat {
        let adjustedIndex = index - activeCardIndex
        if index >= activeCardIndex {
            let progress = min(abs(dragOffset)/(screenWidth/2), 1)
            return 1 - proportion * CGFloat(adjustedIndex) + (dragOffset < 0 ? proportion * progress : -proportion * progress)
        }
        
        return 1
    }
}

#Preview {
    ScrollingCarouselView()
}
