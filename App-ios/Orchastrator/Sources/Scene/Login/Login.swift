//
//  Login.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 03/12/22.
//

import SwiftUI
import AppComponent

struct Login: View {
    var body: some View {
        VStack {
            Text("Login")
            LinkButton(destination: HomeViewBuilder.build(), title: "Login", background: .black, foregroundColor: .black, width: 140, height: 10, corner: 5)
        }

    }
}
