//
//  ErrorView.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 03/12/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            LottieView(name: "error", loopMode: .loop)
                .frame(height: 400)
                Text("Something went wrong")
                .padding(.bottom, 20)
                .font(.title2)
            NavigationLink(destination: Login()
            ) {
                Text("Go Back")
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

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
