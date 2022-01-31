//
//  Ingredient.swift
//  DecodableDefaultValue (iOS)
//
//  Created by tayathorn on 31/1/2565 BE.
//

struct Ingredient: Decodable {
    let id: Int
    let name: String
    let price: Int
    let quantity: Int
    let isDefault: Bool
}
