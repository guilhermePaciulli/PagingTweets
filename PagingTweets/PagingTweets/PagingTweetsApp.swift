//
//  PagingTweetsApp.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 20/02/21.
//

import SwiftUI

@main
struct PagingTweetsApp: App {
    var body: some Scene {
        WindowGroup {
            RollingTweetsView(viewModel: RollingTweetsViewModel())
        }
    }
}
