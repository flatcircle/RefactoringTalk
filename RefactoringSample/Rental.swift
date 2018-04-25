//
//  Rental.swift
//  RefactoringSample
//
//  Created by Jannie Theron on 2018/04/25.
//  Copyright © 2018 Jannie Theron. All rights reserved.
//

import Foundation

struct Rental {

    let movie: Movie
    let daysRented: Int

    func charge() -> Double {
        var result = 0.0
        switch movie.priceCode {
        case Movie.regular:
            result += 2
            if daysRented > 2 {
                result += Double((daysRented - 2)) * 1.5
            }
        case Movie.newRelease:
            result += Double(daysRented * 3)
        case Movie.children:
            result += 1.5
            if daysRented > 3 {
                result += Double((daysRented - 3)) * 1.5
            }
        default:
            break
        }
        return result
    }
}
