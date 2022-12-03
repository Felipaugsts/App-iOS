//
//  SnapCarousel.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 02/12/22.
//

import SwiftUI

public struct SnapCarousel<Content: View, T: Identifiable>:  View {
    var content: (T) -> Content
    var list: [T]

    var spacing: CGFloat
    var trailingSpace: CGFloat
    var width: CGFloat
    var proxyWidth: CGFloat
    @Binding var index: Int

    public init(spacing: CGFloat = 15,proxyWidth: CGFloat, trailingSpace: CGFloat = 100, width: CGFloat, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        self.width = width
        self.proxyWidth = proxyWidth
    }

    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0

    public var body: some View {

            let width = proxyWidth - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing

            HStack(spacing: spacing) {
                ForEach(list){item in
                    content(item)
                        .frame(width: self.width)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .gesture(
            DragGesture()
                .updating($offset, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded({ value in
                    let offsetX = value.translation.width

                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()

                    currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                    currentIndex = index
                })
                .onChanged({ value in
                    let offsetX = value.translation.width

                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()

                    index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)

                })
            )
            .animation(.easeInOut, value: offset == 0)
    }
}

