//
//  Tweet.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 02/03/21.
//

import UIKit

struct Tweet: Equatable {
    let authorName: String
    let authorProfilePicture: UIImage
    let text: String
}

extension Tweet {
    static var mock: Tweet {
        Tweet(
            authorName: "Joe Doe",
            authorProfilePicture: UIImage(systemName: "person.fill")!,
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quisque sagittis purus sit amet volutpat consequat mauris. Consequat id porta nibh venenatis cras sed felis eget. Sit amet massa vitae tortor condimentum la"
        )
    }

    static var listMock: [Tweet] {
        return (0...2).map({ _ in mock })
    }
}
