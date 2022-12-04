//
//  ItemCard.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 02/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
public struct ItemCardFood: View {

    public var title: String
    public var rate: String?
    public var location: String
    public var price: String
    public var timing: String
    public var image: Image

    public init(title: String, rate: String? = nil, location: String, price: String, image: Image, timing: String) {
        self.title = title
        self.rate = rate
        self.location = location
        self.price = price
        self.image = image
        self.timing = timing
    }
    public var body: some View {

        HStack {
            image
                .resizable()
                .frame(width: 50, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 2)

            VStack (alignment: .leading) {
                Text(title)
                    .font(.callout)
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.orange.opacity(0.6))

                    Text(rate ?? "")
                        .foregroundColor(.orange.opacity(0.6))
                        .fontWeight(.semibold)
                        .font(.footnote)

                    Text(location)
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.8))
                        .fontWeight(.regular)

                    Text("1.5 km")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.8))
                        .fontWeight(.regular)
                }

                HStack {
                    Text("\(timing) min")
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Text("R$: \(price)")
                        .padding(.leading, 5)
                        .font(.footnote)
                        .foregroundColor(.green)
                }
            }
            Spacer()
            Image(systemName: "clock.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding()
        .frame(height: 100)
        .background(.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

@available(iOS 15.0, *)
struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ItemCardFood(title: "Test title", location: "test location", price: "20.00", image: Image(""), timing: "45-50")
        }
    }
}
