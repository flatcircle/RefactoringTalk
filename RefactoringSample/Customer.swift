import Foundation

struct Customer {
    let name: String
    var rentals: [Rental]

    init(name: String) {
        self.name = name
        self.rentals = [Rental]()
    }

    mutating func add(rental: Rental) {
        rentals.append(rental)
    }

    func statement() -> String {
        var totalAmount = 0.0
        var frequentRentalPoints = 0

        var result = "Rental for \(name)\n"

        for each in rentals {
            let amount = amountFor(each)

            frequentRentalPoints += 1
            if each.movie.priceCode == Movie.newRelease && each.daysRented > 1 {
                frequentRentalPoints += 1
            }

            totalAmount += amount
        }

        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRentalPoints) frequent renter points"

        return result
    }

    fileprivate func amountFor(_ each: Rental) -> Double {
        var amount = 0.0
        switch each.movie.priceCode {
        case Movie.regular:
            amount += 2
            if each.daysRented > 2 {
                amount += Double((each.daysRented - 2)) * 1.5
            }
        case Movie.newRelease:
            amount += Double(each.daysRented * 3)
        case Movie.children:
            amount += 1.5
            if each.daysRented > 3 {
                amount += Double((each.daysRented - 3)) * 1.5
            }
        default:
            break
        }
        return amount
    }
}

