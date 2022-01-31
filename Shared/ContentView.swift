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
//        VStack {
//            Spacer()
//            PizzaView(pizza: <#Pizza#>)
//            Spacer()
//            PizzaView(pizza: <#Pizza#>)
//            Spacer()
//        }
        
        List(loadPizza()) { pizza in
            PizzaView(pizza: pizza)
            Spacer()
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
                    HStack {
                        Text("name:")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Text(pizza.name)
                            .font(.system(size: 12))
                    }
//                    Spacer()
                    HStack {
                        Text("description:")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Text(pizza.description)
                            .font(.system(size: 12))
                    }
                }
                
            }
        }.padding(.zero)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
