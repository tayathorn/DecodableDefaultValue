# Decodable Default Value ⚙️

### Reference: https://www.swiftbysundell.com/tips/default-decoding-values/

----

## Set defafult value for JSON encoding/decoding
``` swift
// DecodableDefault.swift
enum Sources {
        enum True: Source {
            static var defaultValue: Bool { true }
        }

        enum False: Source {
            static var defaultValue: Bool { false }
        }
        
        enum Zero: Source {
            static var defaultValue: Int { 0 }
        }

        enum DashString: Source {
            static var defaultValue: String { "-" }
        }
        
        enum EmptyString: Source {
            static var defaultValue: String { "" }
        }

        enum EmptyList<T: List>: Source {
            static var defaultValue: T { [] }
        }

        enum EmptyMap<T: Map>: Source {
            static var defaultValue: T { [:] }
        }
    }
```

## Usage
```swift
// Pizza.swift
struct Pizza: Identifiable, Decodable {
    let id: Int
    @Default.EmptyString var name: String
    @Default.Dash var description: String
    let imageUrl: URL?
    @Default.Zero var price: Int
    @Default.True var available: Bool
    @Default.Zero var quantity: Int
    @Default.False var isBOGO: Bool
}
```
