//
//  Repository.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 03/12/22.
//

import Foundation
import SDKCommon
import AppComponent

public protocol HomeViewRepository {
    var popularState: Dynamic<ViewModelState> { get set }

    func fetchPopular() -> Void
}

// MARK: - Implementation

public class DefaultHomeViewRepository: HomeViewRepository {

    // MARK: - variables

    var service: HTTPRequestProtocol
    public var popularState = Dynamic<ViewModelState>(.loading)

    // MARK: - Initializer

    public init(service: HTTPRequestProtocol) {
        self.service = service
    }


    // MARK: - Public methods

    public func fetchPopular() {
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=86e8c11db101d22e54919a702fa851b4&language=en-US&") else {
            popularState.value = .error("Invalid URL")
            return
        }
        
        service.fetch(url: url) { (result: Result<MovieModel, Error>) in
            switch result {
            case .success(let response):
                if response.results.isEmpty {
                    self.popularState.value = .empty("Empty")
                } else {
                    self.popularState.value = .loaded(self.loadImages(results: response))
                }
            case .failure(let failure):
                self.popularState.value = .error("error: \(failure)")
            }
        }
    }

    // MARK: - Private methods

   private func loadImages(results: MovieModel) -> [Post] {

        var carousel: [Post] = []
        for movie in results.results {

            if let endpoint = movie.posterPath {
                var image = "https://image.tmdb.org/t/p/w500\(endpoint)"
                carousel.append(Post(image: image , imageId: "\(movie.id)"))
            }
        }
        return carousel
    }
}
