//
//  RollingTweets.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 02/03/21.
//

import SwiftUI
import Combine
import ComposableArchitecture

struct AppEnvironment { }

struct AppState: Equatable {
    var tweets: [Tweet]
    var isLoading: Bool
}

enum AppAction {
    case loading
}

let reducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .loading:
        state.isLoading = true
        return .
    }
}

struct RollingTweetsView: View {
//    @ObservedObject var viewModel: ViewModel
    @State var currentIndex = 0
    
    var body: some View {
        Text("")
//        RollerView(pageCount: viewModel.tweets.count, currentIndex: $currentIndex) { index in
//            TweetView(tweet: viewModel.tweets[index])
//        }
//        onAppear(perform: {
//            viewModel.loadTweets()
//        })
    }
}

struct RollingTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        RollingTweetsView(
//            viewModel: RollingTweetsViewModel()
        )
    }
}

struct RollerView<Content: View>: View {
    let spacing: CGFloat = 0
    let height: CGFloat = .screenHeight * 0.8
    let pageCount: Int
    @Binding var currentIndex: Int
    @GestureState private var translation: CGFloat = 0
    let content: (Int) -> Content

    init(pageCount: Int,
         currentIndex: Binding<Int>,
         @ViewBuilder content: @escaping (Int) -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content
    }

    var body: some View {
        VStack(spacing: spacing) {
            ForEach((0..<pageCount), id: \.self) { index in
                content(index).frame(height: height)
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
                let offset = value.translation.height * 2 / (height + spacing)
                let newIndex = (CGFloat(currentIndex) - offset).rounded()
                currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
            }
        )
    }
}
