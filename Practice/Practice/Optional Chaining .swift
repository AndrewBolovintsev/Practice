//
//  Optional Chaining .swift
//  Practice
//
//  Created by Андрей Боловинцев on 30.06.24.
//

import Foundation

func optionalChaining() {
    
    let john = Person1()
    
    if let roomCount1 = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount1) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    
    john.residence = Residence1()
    
    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    
    john.residence?.rooms.append(Room1(name: "Living Room"))
    john.residence?.rooms.append(Room1(name: "Bathroom"))
    john.residence?.rooms.append(Room1(name: "Kitchen"))
    
    if let firstRoomName = john.residence?.rooms[1].name {
        print("The first room name is \(firstRoomName).")
    } else {
        print("Unable to retrieve the first room name.")
    }
    
    john.residence?.address = createAddress(buildingName: "Warsaw", buildingNumber: "34", street: "Acacia Road")
    if let buildingNumber = john.residence?.address?.buildingNumber {
        print(buildingNumber)
    }
    else {
        print("nil")
    }
    
    if john.residence?.printNumberOfRooms() != nil {
        print("It was possible to print the number of rooms.")
    } else {
        print("It was not possible to print the number of rooms.")
    }
    
    john.residence?[0] = Room1(name: "Bedroom")
    
    if let firstRoomName = john.residence?[0].name {
        print("The first room name is \(firstRoomName).")
    } else {
        print("Unable to retrieve the first room name.")
    }
    
    var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
    testScores["Dave"]?[0] = 91
    testScores["Bev"]?[0] += 1
    testScores["Brian"]?[0] = 72
    print(testScores)
    
    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }
    
    let johnsAddress = Address1()
    johnsAddress.buildingName = "The Larches"
    johnsAddress.street = "Laurel Street"
    john.residence?.address = johnsAddress
    
    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }
    
    if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
        print("John's building identifier is \(buildingIdentifier).")
    }
    
    if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier doesn't begin with \"The\".")
    }
}

func createAddress(buildingName: String, buildingNumber: String, street: String) -> Address1? {
    guard !buildingName.isEmpty, !buildingName.isEmpty, !street.isEmpty else { return nil }
    
    let someAddress = Address1()
    someAddress.buildingName = buildingName
    someAddress.buildingNumber = buildingNumber
    someAddress.street = street
    
    return someAddress
}

class Person1 {
    var residence: Residence1?
}
class Residence1 {
    
    var rooms: [Room1] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room1 {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address1?
}
class Room1 {
    let name: String
    init(name: String) { self.name = name }
}
class Address1 {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
