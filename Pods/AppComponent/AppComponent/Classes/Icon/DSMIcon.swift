//
//  DSMIcon.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 21/11/22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct DSMIcon: View {
    var src: String
    var width = 15.00
    var height = 15.00
    var padding = 10.00
    var shadow = 10.00
    var foregroundColor: Color
    var backgroundColor: Color

    public init(src: String, width: CGFloat = 15.00, height: CGFloat = 15.00, padding: CGFloat = 10.00, shadow: CGFloat = 10.00, foregroundColor: Color, backgroundColor: Color) {
        self.src = src
        self.width = width
        self.height = height
        self.padding = padding
        self.shadow = shadow
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        Image(systemName: src)
            .resizable()
            .frame(width: width, height: height)
            .padding(padding)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(Circle())
            .shadow(radius: shadow)
    }
}

@available(iOS 13.0, *)
struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        DSMIcon(src: "magnifyingglass", foregroundColor: .white, backgroundColor: .secondary)
    }
}
