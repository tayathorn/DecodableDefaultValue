//
//  DecodableDefaultTests.swift
//  Tests iOS
//
//  Created by tayathorn on 3/3/2565 BE.
//

@testable import DecodableDefaultValue
import XCTest

final class DecodableDefaultTests: XCTestCase {
    func test_pizzaDefaultValue() {
        let pizza = PizzaMock.emptyPizza
        
        XCTAssertEqual(pizza.id, 1)
        XCTAssertEqual(pizza.name, "")
        XCTAssertEqual(pizza.description, "-")
        XCTAssertEqual(pizza.imageUrl?.absoluteString, "https://1112.minorcdn.com/1112/public/images/products/pizza/Oct2021/102217_MP.png")
        XCTAssertEqual(pizza.ingredients.count, 0)
        XCTAssertEqual(pizza.price, 0)
        XCTAssertTrue(pizza.available)
        XCTAssertEqual(pizza.quantity, 0)
        XCTAssertFalse(pizza.isBOGO)
    }
    
    func test_ingredientDefaultValue() {
        let pizza = PizzaMock.pizzaWithEmptyIngredient
        
        XCTAssertEqual(pizza.id, 2)
        XCTAssertEqual(pizza.ingredients.count, 1)
        XCTAssertEqual(pizza.ingredients[0].id, 456)
        XCTAssertEqual(pizza.ingredients[0].name, "")
        XCTAssertEqual(pizza.ingredients[0].price, 0)
        XCTAssertEqual(pizza.ingredients[0].quantity, 0)
        XCTAssertTrue(pizza.ingredients[0].isDefault)
    }
    
    func test_pizzaWithIngredients() {
        let pizza = PizzaMock.pizzaWithIngredients
        
        XCTAssertEqual(pizza.id, 3)
        XCTAssertEqual(pizza.name, "Double Pepperoni")
        XCTAssertEqual(pizza.description, "Pepperoni and Pizza Sauce")
        XCTAssertEqual(pizza.imageUrl?.absoluteString, "https://1112.minorcdn.com/1112/public/images/products/pizza/Oct2021/102217_MP.png")
        XCTAssertEqual(pizza.price, 329)
        XCTAssertTrue(pizza.available)
        XCTAssertEqual(pizza.quantity, 1)
        XCTAssertTrue(pizza.isBOGO)
        
        XCTAssertEqual(pizza.ingredients.count, 2)
        XCTAssertEqual(pizza.ingredients[0].id, 111)
        XCTAssertEqual(pizza.ingredients[0].name, "Pepperoni")
        XCTAssertEqual(pizza.ingredients[0].price, 49)
        XCTAssertEqual(pizza.ingredients[0].quantity, 1)
        XCTAssertTrue(pizza.ingredients[0].isDefault)
        
        XCTAssertEqual(pizza.ingredients[1].id, 123)
        XCTAssertEqual(pizza.ingredients[1].name, "Cheese")
        XCTAssertEqual(pizza.ingredients[1].price, 49)
        XCTAssertEqual(pizza.ingredients[1].quantity, 1)
        XCTAssertFalse(pizza.ingredients[1].isDefault)
    }
    
    func test_directlyCreatePizza() {
        let pizza = Pizza(id: 11,
                          name: .init(wrappedValue: "Test"),
                          description: .init(wrappedValue: "Test Pizza"),
                          imageUrl: nil,
                          ingredients: .init(),
                          price: .init(wrappedValue: 999),
                          available: .init(),
                          quantity: .init(wrappedValue: 3),
                          isBOGO: .init(wrappedValue: true))
        
        XCTAssertEqual(pizza.id, 11)
        XCTAssertEqual(pizza.name, "Test")
        XCTAssertEqual(pizza.description, "Test Pizza")
        XCTAssertEqual(pizza.imageUrl?.absoluteString, nil)
        XCTAssertEqual(pizza.ingredients.count, 0)
        XCTAssertEqual(pizza.price, 999)
        XCTAssertTrue(pizza.available)
        XCTAssertEqual(pizza.quantity, 3)
        XCTAssertTrue(pizza.isBOGO)
    }
}
