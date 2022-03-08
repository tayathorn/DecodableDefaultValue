struct Ingredient: Decodable {
    let id: Int
    @Default.EmptyString var name: String
    @Default.Zero var price: Int
    @Default.Zero var quantity: Int
    @Default.True var isDefault: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, name, price, quantity
        case isDefault = "is_default"
    }
}

// ==============================================================
// MARK: - Traditional Way

struct TraditionalIngredient: Decodable {
    let id: Int
    let name: String
    let price: Int
    let quantity: Int
    let isDefault: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, name, price, quantity
        case isDefault = "is_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        price = try container.decodeIfPresent(Int.self, forKey: .price) ?? 0
        isDefault = try container.decodeIfPresent(Bool.self, forKey: .isDefault) ?? true
        quantity = try container.decodeIfPresent(Int.self, forKey: .name) ?? 0
    }
    
}
