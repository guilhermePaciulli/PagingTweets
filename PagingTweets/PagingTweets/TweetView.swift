//
//  TweetView.swift
//  PagingTweets
//
//  Created by Guilherme Paciulli on 20/02/21.
//

import SwiftUI

struct TweetView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
                Spacer()
                Text("Joe Doe")
                    .font(.system(size: 32, weight: .semibold))
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
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quisque sagittis purus sit amet volutpat consequat mauris. Consequat id porta nibh venenatis cras sed felis eget. Sit amet massa vitae tortor condimentum la")
                .font(.system(size: 24))
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
        TweetView()
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
