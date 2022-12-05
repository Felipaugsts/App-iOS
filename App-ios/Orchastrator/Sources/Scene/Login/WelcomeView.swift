//
//  WecomeView.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 04/12/22.
//

import SwiftUI
import AppComponent

struct WelcomeView: View {
    
    var body: some View {
            VStack {
                Spacer()
                VStack {
                    Image("branding")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)

                    LinkButton(destination: Login(), title: "Login", background: Color.black.opacity(0.8), foregroundColor: .white, width: 151, height: 10, corner: 5)
                    .padding(.top, 35)

                    LinkButton(destination: Login(), title: "Register", background: .blue.opacity(0.1), foregroundColor: .black, width: 140, height: 10, corner: 5)
                    .padding(.top, 10)
                }
                .padding(.bottom, 70)
            }
            .background(
                Image("welcomebg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .navigationBarBackButtonHidden()
    }
}

struct WecomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
