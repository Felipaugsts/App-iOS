//
//  LottieView.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 05/12/22.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {

    // MARK: - Variables
    
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()

    // MARK: - Initializer

    public init(name: String, loopMode: LottieLoopMode, animationView: LottieAnimationView = LottieAnimationView()) {
        self.name = name
        self.loopMode = loopMode
        self.animationView = animationView
    }

    // MARK: - Public methods

    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
