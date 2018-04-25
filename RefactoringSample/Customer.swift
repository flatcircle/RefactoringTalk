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

        var result = "Rental for \(name)\n"

        result += "Amount owed is \(getTotalCharge())\n"
        result += "You earned \(getTotalFrequentRentalPoints()) frequent renter points"

        return result
    }

    func getTotalCharge() -> Double {
        var totalAmount = 0.0
        for each in rentals {

            totalAmount += each.charge()
        }
        return totalAmount
    }

    func getTotalFrequentRentalPoints() -> Int {
        var frequentRentalPoints = 0
        for each in rentals {

            frequentRentalPoints += each.getFrequentRentalPoints()

        }
        return frequentRentalPoints
    }
}

