//
//  Pizza.swift
//  DecodableDefaultValue (iOS)
//
//  Created by tayathorn on 31/1/2565 BE.
//

struct Pizza: Decodable {
    let id: Int
    @Default.EmptyString var name: String
    @Default.EmptyString var description: String
    @Default.EmptyString var imageUrl: String
    @Default.EmptyList var ingredients: [Ingredient]
    @Default.Zero var price: Int
    @Default.True var available: Bool
    @Default.Zero var quantity: Int
    @Default.False var isBOGO: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, ingredients, price, available, quantity
        case imageUrl = "image_url"
        case isBOGO = "is_bogo"
    }
}


// MARK: - Traditional Way

struct TraditionalPizza: Decodable {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
    let ingredients: [Ingredient]
    let price: Int
    let available: Bool
    let quantity: Int
    let isBOGO: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, ingredients, price, available, quantity
        case imageUrl = "image_url"
        case isBOGO = "is_bogo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .ingredients) ?? []
        price = try container.decodeIfPresent(Int.self, forKey: .price) ?? 0
        available = try container.decodeIfPresent(Bool.self, forKey: .available) ?? true
        quantity = try container.decodeIfPresent(Int.self, forKey: .name) ?? 0
        isBOGO = try container.decodeIfPresent(Bool.self, forKey: .isBOGO) ?? false
    }
    
}
