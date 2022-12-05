//
//  Login.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 03/12/22.
//

import SwiftUI
import AppComponent

struct Login: View {
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack  {
            VStack (alignment: .leading) {
                Text("Welcome back!")
                    .font(.title)
                Text("Glad to see you, Again!")
                    .font(.title)
            }

            VStack ( alignment: .trailing ,spacing: 20) {
                TextField("Username", text: $username)
                    .frame(height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 14)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray.opacity(0.4)))


                SecureField("Password", text: $password)
                    .frame(height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 14)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray.opacity(0.4)))

                LinkButton(destination: WelcomeView(), title: "Forgot password?", background: .white, foregroundColor: .gray, width: 0, height: 5, weight: .light)
            }
            .frame(height: 250)
            .padding(25)


            LinkButton(destination: HomeViewBuilder.build(), title: "Login", background: .black, foregroundColor: .white, width: 150, height: 10, corner: 5)

            HStack (spacing: 30) {
                Button {
                    print("1")
                } label: {
                    Image("fb")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                }

                Button {
                    print("1")
                } label: {
                    Image("google")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                }
                
                Button {
                    print("1")
                } label: {
                    Image("apple")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                }
            }
            .padding(.top, 36)

            Spacer()


            LinkButton(destination: WelcomeView(), title: "Register Now", background: .white, foregroundColor: .black, width: 0, height: 10, weight: .regular)

        }
        .padding(.top, 50)

    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
