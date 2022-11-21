//
//  DSMImage.swift
//  AppComponent
//
//  Created by FELIPE AUGUSTO SILVA on 21/11/22.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DSMImage: View {
    var url: URL?

    public init(url: URL?) {
        self.url = url
    }
    public var body: some View {
        VStack {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "alert")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct DSMImage_Previews: PreviewProvider {
    static var previews: some View {
        DSMImage(url: nil)
    }
}
