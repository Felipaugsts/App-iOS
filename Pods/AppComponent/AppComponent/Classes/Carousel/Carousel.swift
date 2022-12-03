//
//  Carousel.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 02/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

public struct Post: Identifiable {
    public var id = UUID().uuidString
    public var imageId: String
    public var image: String

    public init(image: String, imageId: String) {
        self.image = image
        self.imageId = imageId
    }
}

public struct Carousel: View {
    @State var currentIndex: Int = 0
    @State var posts: [Post]

    var height: CGFloat
    var width: CGFloat?
    var contentMode: ContentMode
    var indicator: Bool

    public var onClick: ((_ image: Post) -> Void)

    public init(images: [Post],
                contentMode: ContentMode = .fit,
                height: CGFloat = 200,
                width: CGFloat? = 300,
                indicator: Bool = false,
                onClick: @escaping ((_ image: Post) -> Void)) {
        self.posts = images
        self.height = height
        self.width = width
        self.indicator = indicator
        self.contentMode = contentMode
        self.onClick = onClick
    }
    
    public var body: some View {
        VStack {
            GeometryReader { proxy in
                SnapCarousel(proxyWidth: proxy.size.width, trailingSpace: 100, width: width ?? proxy.size.width, index: $currentIndex, items: posts) { post in
                    let url = URL(string: post.image)

                    WebImage(url: url)
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: contentMode)
                        .frame(width: width ?? proxy.size.width, height: height)
                        .onTapGesture {
                            onClick(post)
                        }
                }
            }

            Spacer()
            if indicator {
                HStack(spacing: 10) {
                    ForEach(posts.indices,id: \.self) { index in
                        Circle()
                            .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                            .frame(width: 10, height: 10)
                            .scaleEffect(currentIndex == index ? 1.2 : 1)
                            .animation(.spring(), value: currentIndex == index)
                    }
                }
            }
        }
        .frame(height: height)
    }
}

