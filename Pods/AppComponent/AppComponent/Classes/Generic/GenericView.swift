//
//  GenericView.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 05/12/22.
//

import SwiftUI
import Lottie

public struct GenericView<T: View> :View {

    var image: String
    var loopMode: LottieLoopMode = .playOnce
    var msg: String
    var present: T
    var buttonText: String

    public init(image: String, loopMode: LottieLoopMode, msg: String, present: T, buttonText: String) {
        self.image = image
        self.loopMode = loopMode
        self.msg = msg
        self.present = present
        self.buttonText = buttonText
    }

    public var body: some View {
        VStack {
            LottieView(name: image, loopMode: loopMode)
                .frame(height: 400)
            Text(msg)
                .padding(.bottom, 20)
                .font(.title2)
            NavigationLink(destination: present
            ) {
                Text(buttonText)
            }
            .foregroundColor(Color.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background {
                Color.blue.opacity(0.8)
            }
            .cornerRadius(10)

            Spacer()
        }
    }
}
