//
//  HomeViewPresentation.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 19/11/22.
//

import SwiftUI
import AppComponent
import SDKCommon

public struct HomeView: View {

    @State private var isShowing = false

    var movies: [Post]

    public var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }

                VStack {
                    Carousel(images: movies) { image in
                        print(image.imageId)
                    }
                    NavigationLink("Go to another module") {
                        TestView()
                    }
                    Spacer()
                }
                .background(Color.black)
                .cornerRadius(isShowing ? 20 : 10)
                .offset(x: isShowing ? 200 : 0, y: isShowing ? 44 : 0)
                .scaleEffect(isShowing ? 0.8 : 1)
                .allowsHitTesting(isShowing ? false : true)
                .shadow(radius: isShowing ? 10 : 0)

                .navigationBarItems(leading:
                                        Button(action: {
                    withAnimation(.spring())
                    {
                        isShowing.toggle()
                    }
                }) {
                    DSMIcon(src: "line.horizontal.3",
                            width: 16,
                            height: 16,
                            foregroundColor: .white,
                            backgroundColor: .primary)
            
                })

                .navigationBarItems(trailing:
                                        Button(action: {
                }) {
                    DSMIcon(src: "magnifyingglass",
                            foregroundColor: .white,
                            backgroundColor: .primary)
                })
                .navigationBarTitleDisplayMode(.inline)

            }
            .background(Color.black)
        }
    }
}
