//
//  ARC.swift
//  Practice
//
//  Created by Андрей Боловинцев on 25.06.24.
//

import Foundation

func arc() {
    
    var reference1: Person11?
    var reference2: Person11?
    var reference3: Person11?
    
    reference1 = Person11(name: "John Appleseed")
    reference2 = reference1
    reference3 = reference1
    
    reference1 = nil
    reference2 = nil
    reference3 = nil
    
    
    
    var john: Person2?
    var unit4A: Apartment2?
    
    john = Person2(name: "John Appleseed")
    unit4A = Apartment2(unit: "4A")
    
    john!.apartment = unit4A
    unit4A!.tenant = john
    
    john = nil
    unit4A = nil
    
    
    
    
    var john1: Customer?
    john1 = Customer(name: "John Appleseed")
    john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)
    
    john1 = nil
    
    
    
    let department = Department(name: "Horticulture")

    let intro = Course(name: "Survey of Plants", in: department)
    let intermediate = Course(name: "Growing Common Herbs", in: department)
    let advanced = Course(name: "Caring for Tropical Plants", in: department)

    intro.nextCourse = intermediate
    intermediate.nextCourse = advanced
    department.courses = [intro, intermediate, advanced]
    
    
    
    var country = Country(name: "Canada", capitalName: "Ottawa")
    print("\(country.name)'s capital city is called \(country.capitalCity.name)")
    
    
    
    let heading = HTMLElement(name: "h1")
    let defaultText = "some default text"
    heading.asHTML = {
        return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
    }
    print(heading.asHTML())
    
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
    print(paragraph!.asHTML())
    
    paragraph = nil
}


class Person11{
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}



class Person2 {
    
    let name: String
    var apartment: Apartment2?
    
    init(name: String) { self.name = name }

    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    
    let unit: String
    weak var tenant: Person2?
    
    init(unit: String) { self.unit = unit }

    deinit { print("Apartment \(unit) is being deinitialized") }
}



class Customer {
    
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    
    let number: Int
    unowned let customer: Customer
    
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit { print("Card \(number) is being deinitialized") }
}



class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}



class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}



class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {  [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}
