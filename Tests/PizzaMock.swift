@testable import DecodableDefaultValue
import Foundation

struct PizzaMock {
    static var pizzas: [Pizza]  = {
        let bundle = Bundle(for: DecodableDefaultTests.self)
        let url = bundle.url(forResource: "pizzaTest", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let pizzas = try! decoder.decode([Pizza].self, from: data)
        
        return pizzas
    }()
    
    static var emptyPizza: Pizza {
        pizzas[0]
    }
    
    static var pizzaWithEmptyIngredient: Pizza {
        pizzas[1]
    }
    
    static var pizzaWithIngredients: Pizza {
        pizzas[2]
    }
}
