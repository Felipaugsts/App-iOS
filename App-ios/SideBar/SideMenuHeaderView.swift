//
//  SideMenuHeaderView.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 18/11/22.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    @State var userName = "Felipe Augusto"
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Button(action: {
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .frame(width: 58, height: 58)
                    .foregroundColor(.white)
                    .padding()
            }
            VStack(alignment: .leading) {
                    Image("phil")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .padding(.bottom, 16)
                HStack{
                    Text(userName)
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}
