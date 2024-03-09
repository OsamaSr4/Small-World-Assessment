//
//  FakeData..swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import Small_World_Assessment

struct FakeData {
    struct FakeListData {
        static func makeFakeSuccessData() -> MovieListResponse {
            let movies = [MovieModel(id: 1,
                                    title: "Harry Potter 1",
                                    description: "Harry Potter is a film series based on the eponymous novels by J. K. Rowling.",
                                    releaseDate: "2022-06-24"),
                          MovieModel(id: 2,
                                            title: "Harry Potter 2",
                                            description: "The series is produced and distributed by Warner Bros.",
                                            releaseDate: "2022-06-24"),
                          MovieModel(id: 3,
                                            title: "Harry Potter 3",
                                            description: "Pictures and consists of eight fantasy films, beginning with Harry Potter and the Philosopher's Stone and culminating with Harry Potter and the Deathly Hallows – Part 2",
                                            releaseDate: "2022-06-24")]
            return MovieListResponse(result: movies)
        }
    }
    
    struct FakeDetailsData {
        static func makeFakeSuccessData() -> MovieDetails {
            return MovieDetails(id: 1,
                                     title: "Harry Potter",
                                homepageLink: "https://www.imdb.com/title/tt0241527/", description: "Harry Potter is a film series based on the eponymous novels by J. K. Rowling.",
                                releaseDate: "2022-06-24",
                                posterPath: "https://tinyurl.com/2w3jezr9")
        }
    }


    static func makeFakeFailureData() -> BaseError {
        return BaseError(message: Constants.NetworkCallError.wentWrong.rawValue)
    }
}
