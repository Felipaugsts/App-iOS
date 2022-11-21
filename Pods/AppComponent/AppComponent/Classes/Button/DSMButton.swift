//
//  DSMButton.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 21/11/22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct DSMButton: View {
    public var label: String
    public var background: Color = .blue.opacity(0.4)
    public var foregroundColor: Color = .black
    public var corner = 10.00
    public var vPadding = 10.00
    public var hPadding = 10.00
    public var onButtonClick: (() -> Void)

    public init(label: String, background: Color = Color.blue.opacity(0.4), foregroundColor: Color = .black, corner: CGFloat = 10.00, vPadding: CGFloat = 10.00, hPadding: CGFloat = 10.00, onButtonClick: @escaping (() -> Void) ) {
        self.label = label
        self.background = background
        self.foregroundColor = foregroundColor
        self.corner = corner
        self.vPadding = vPadding
        self.hPadding = hPadding
        self.onButtonClick = onButtonClick
    }

    public var body: some View {
        Button(action: onButtonClick) {
            Text(label)
        }
        .foregroundColor(foregroundColor)
        .padding(.vertical, vPadding)
        .padding(.horizontal, hPadding)
        .background(background)
        .cornerRadius(corner)

    }
}

struct Button_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        DSMButton(label: "Button") {
            print("button clicked")
        }
    }
}
