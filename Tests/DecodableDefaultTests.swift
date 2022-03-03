//
//  DecodableDefaultTests.swift
//  Tests iOS
//
//  Created by tayathorn on 3/3/2565 BE.
//

@testable import DecodableDefaultValue
import XCTest

final class DecodableDefaultTests: XCTestCase {
    func testPizzaDefaultValue() {
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
}
