//
//  TweetView.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 20/02/21.
//

import SwiftUI

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(uiImage: tweet.authorProfilePicture)
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
                    .foregroundColor(.black)
                Spacer()
                Text(tweet.authorName)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
            }.padding([.leading, .trailing], 12)
            HStack {
                Button(action: {}, label: {
                    Image(uiImage: "retweet")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                })
                .frame(width: 44, height: 44)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                })
                .frame(width: 44, height: 44)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                })
                .frame(width: 44, height: 44)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                })
                .frame(width: 44, height: 44)
            }.foregroundColor(.black)
            Text(tweet.text)
                .font(.system(size: 24))
                .foregroundColor(.black)
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(15.0)
        .shadow(radius: 5)
        .padding([.leading, .trailing], 24)
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: .mock)
            .preferredColorScheme(.dark)
    }
}

extension Image {
    init(uiImage named: String) {
        guard let uiImage = UIImage(named: named)?.withRenderingMode(.alwaysTemplate) else {
            self.init(systemName: "")
            return
        }
        self.init(uiImage: uiImage)
    }
}
