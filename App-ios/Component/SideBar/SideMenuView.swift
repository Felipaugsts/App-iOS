//
//  SideMenuView.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import SwiftUI
import AppComponent

struct SideMenuView: View {
    @Binding var isShowing: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 150)
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(destination: option.views) {
                        SideMenuOptionView(option: option)
                    }
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)

    }
}
