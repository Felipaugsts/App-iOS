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
    public var onClick: ((_ image: Post) -> Void)

    public init(images: [Post], onClick: @escaping ((_ image: Post) -> Void)) {
        self.posts = images
        self.onClick = onClick
    }
    
    public var body: some View {
        VStack {
            SnapCarousel(trailingSpace: 130, index: $currentIndex, items: posts) { post in
                GeometryReader { proxy in
                    let size = proxy.size
                    let url = URL(string: post.image)

                    WebImage(url: url)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(10)
                }
                .onTapGesture {
                    onClick(post)
                }
            }
            .padding(.vertical, 40)

            Spacer()

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
}

