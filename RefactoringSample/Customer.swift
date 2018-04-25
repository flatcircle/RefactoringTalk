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

    fileprivate func getFrequentRentalPoints(_ each: Rental) -> Int {

        var frequentRentalPoints = 1
        if each.movie.priceCode == Movie.newRelease && each.daysRented > 1 {
            frequentRentalPoints += 1
        }
        return frequentRentalPoints
    }

    func statement() -> String {
        var totalAmount = 0.0
        var frequentRentalPoints = 0

        var result = "Rental for \(name)\n"

        for each in rentals {

            frequentRentalPoints += getFrequentRentalPoints(each)

            totalAmount += each.charge()
        }

        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRentalPoints) frequent renter points"

        return result
    }
}

