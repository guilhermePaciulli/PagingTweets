//
//  ContentView.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var currentIndex = 0
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex) {
            TweetView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension CGFloat {
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

struct PagerView<Content: View>: View {
    let spacing: CGFloat = 32
    let height: CGFloat = .screenHeight * 0.6
    let pageCount: Int
    @Binding var currentIndex: Int
    @GestureState private var translation: CGFloat = 0
    let content: Content

    init(pageCount: Int,
         currentIndex: Binding<Int>,
         @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    var body: some View {
        VStack(spacing: spacing) {
            ForEach((0...pageCount), id: \.self) { index in
                content.frame(height: height)
                    .onTapGesture { currentIndex = index }
                    .scaleEffect(
                        CGSize(width: 1.0 - CGFloat(abs(currentIndex - index)) / CGFloat(pageCount),
                               height: 1.0 - CGFloat(abs(currentIndex - index)) / CGFloat(pageCount))
                    )
            }
        }
        .frame(height: height, alignment: .top)
        .offset(y: -CGFloat(currentIndex) * (height + spacing))
        .offset(y: translation)
        .animation(.interactiveSpring(), value: currentIndex)
        .animation(.interactiveSpring(), value: translation)
        .gesture(
            DragGesture().updating($translation) { value, state, _ in
                state = value.translation.height
            }.onEnded { value in
                let offset = value.translation.height / (height + spacing)
                let newIndex = (CGFloat(currentIndex) - offset).rounded()
                currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
            }
        )
    }
}
