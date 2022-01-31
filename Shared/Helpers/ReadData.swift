//
//  ReadData.swift
//  DecodableDefaultValue (iOS)
//
//  Created by tayathorn on 31/1/2565 BE.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var pizzas = [Pizza]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "pizzaData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let pizzas = try? JSONDecoder().decode([Pizza].self, from: data!)
        self.pizzas = pizzas!
        
    }
     
}
