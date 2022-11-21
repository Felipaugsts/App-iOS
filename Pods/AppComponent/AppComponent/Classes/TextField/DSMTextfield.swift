//
//  DSMTextfield.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 21/11/22.
//

import SwiftUI

@available(iOS 13.0, *)
public struct DSMTextfield: View {

    // MARK: - Variables

    @State var text = ""
    var style: textFieldStyle = .none
    var placeholder: String

    public init(style: textFieldStyle = .none, placeholder: String) {
        self.style = style
        self.placeholder = placeholder
    }

    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                switch style {
                case .none:
                    Text("")
                case .withIcon(let icon):
                    Image(systemName: icon)
                }
                TextField(placeholder, text: $text)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
    }

}

// MARK: - Enum

public enum textFieldStyle: Equatable {
    case none
    case withIcon(icon: String)
}

// MARK: - Preview

@available(iOS 13.0, *)
struct DSMTextfield_Previews: PreviewProvider {
    static var previews: some View {
        DSMTextfield(style: .none, placeholder: "Search something")
    }
}
