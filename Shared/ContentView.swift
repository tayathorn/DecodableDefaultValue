//
//  ContentView.swift
//  Shared
//
//  Created by tayathorn on 31/1/2565 BE.
//

import SwiftUI

struct ContentView: View {
    func loadPizza() -> [Pizza] {
        let url = Bundle.main.url(forResource: "pizzaData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let pizzas = try? decoder.decode([Pizza].self, from: data)
        
        return pizzas!
    }
    
    var body: some View {
        List(loadPizza()) { pizza in
            PizzaView(pizza: pizza)
        }
    }
}

struct PizzaView: View {
    var pizza: Pizza
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pizza \(pizza.id)")
                .font(.headline)
            
            HStack {
                AsyncImage(
                    url: pizza.imageUrl,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).frame(width: 100, height: 100, alignment: .center)
                
                VStack(alignment: .leading) {
                    DetailView(title: "name", value: pizza.name)
                    DetailView(title: "description", value: pizza.description)
                    DetailView(title: "price", value: pizza.price.formatted())
                    DetailView(title: "available", value: pizza.available.description)
                    DetailView(title: "isBOGO", value: pizza.isBOGO.description)
                }
                
            }
        }.padding(.zero)
    }
}

struct DetailView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .font(.system(size: 12))
                .fontWeight(.semibold)
            Text(value)
                .font(.system(size: 12))
        }.padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
