//
//  LinkButton.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 04/12/22.
//

import SwiftUI
import Combine


public struct LinkButton<T:View>: View {

    private var destination: T
    private var title: String
    private var background: Color
    private var foregroundColor: Color
    private var width: CGFloat
    private var height: CGFloat
    private var corner: CGFloat
    private var weight: Font.Weight

    public init(destination: T, title: String, background: Color, foregroundColor: Color, width: CGFloat, height: CGFloat, corner: CGFloat = 15, weight: Font.Weight = .semibold) {
        self.destination = destination
        self.title = title
        self.background = background
        self.foregroundColor = foregroundColor
        self.width = width
        self.height = height
        self.corner = corner
        self.weight = weight
    }

    public var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .foregroundColor(foregroundColor)
                .fontWeight(weight)
                .padding(.horizontal, width)
                .padding(.vertical, height)
                .background(background)
                .cornerRadius(corner)
        }
    }
}


