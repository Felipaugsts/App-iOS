//
//  ContentView.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import SwiftUI
import SDKCommon
import AppComponent


public struct ContentView<ViewModel>: View where ViewModel: ContentViewProtocol {

    // MARK: - Initializer

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Variables

    @ObservedObject
    private var viewModel: ViewModel

    public  var body: some View {
            ZStack {
                switch viewModel.state {
                case .loaded(let movies):
                    HomeView(movies: movies)
                case .empty(let message):
                    Text(message)
                case .error(let message):
                    GenericView(image: "error",
                                loopMode: .loop,
                                msg: message,
                                present: Login(),
                                buttonText: "Try again")
                case .loading:
                    ProgressView()
                case .noAuthenticated:
                    WelcomeView()
                }
            }.onAppear(perform: viewModel.loadMovies)
            .navigationBarBackButtonHidden()
    }
}
