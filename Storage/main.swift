//Task 1: Define the `Item` Type Alias

//Create a type alias named `Item` which represents a `String`. This will be used as the base type for serialization.

typealias Item = String

//Task 2: Define the `Storable` Protocol
//--------------------------------------
//Create a protocol `Storable` with the following requirements:
//- A function `serialize() -> Item` that converts the conforming type to `Item`.
//- A static function `deserialize(from item: Item) -> Self?` that creates an instance of the conforming type from `Item`.

protocol Storable {
  func serialize() -> Item
  static func deserialize(from item: Item) -> Self?
}

//Task 3: Conform Basic Types to `Storable`
//----------------------------------------
//Make `Int`, `Double`, and `String` conform to the `Storable` protocol. Implement the required methods for each type.

extension Int: Storable {
  func serialize() -> Item {
    return Item(self)
  }
  
  static func deserialize(from item: Item) -> Self? {
    return Int(item)
  }
}

extension Double: Storable {
  func serialize() -> Item {
    return Item(self)
  }
  
  static func deserialize(from item: Item) -> Self? {
    return Double(item)
  }
}

extension String: Storable {
  func serialize() -> Item {
    return self
  }
  
  static func deserialize(from item: Item) -> Self? {
    return item
  }
}

//Task 4: Define the `Storage` Protocol
//-------------------------------------
//Create a protocol `Storage` with the following requirements:
//- A function `save<Value: Storable>(key: String, value: Value)`
//- A function `retrieve(key: String) -> Optional<Any>`
//- A function `remove(key: String)`

protocol Storage {
  func save<Value: Storable>(key: String, value: Value)
  func retrieve(key: String) -> Optional<Item>
  func remove(key: String)
}

//Task 5: Implement `Cache` and `Disk` Classes
//--------------------------------------------
//Create two classes `Cache` and `Disk`, both conforming to the `Storage` protocol. Implement the methods with simple storage mechanisms.

// Required
class Cache: Storage {
    func retrieve(key: String) -> Optional<Item> {
        
    }
    
  // Your implementation here
  // Hint: use Dictionary<String, Storable> as a vault/chest
        private var storage: [String: Storable] = [:]
        
        func save<Value: Storable>(key: String, value: Value) {
            storage[key] = value
        }
        
        func retrieve(key: String) -> Storable? {
            return storage[key]
        }
        
        func remove(key: String) {
            storage[key] = nil
        }
    }
    


// Optional
//class Disk: Storage {
  // Your implementation here
  // Hint: use FileManager as a vault/chest
//}


class Disk: Storage {
    func retrieve(key: String) -> Optional<Item> {
        <#code#>
    }
    
    func save<Value: Storable>(key: String, value: Value) {
        let serializedValue = value.serialize()
        
        // Perform disk storage operations to save the value
        // Example: Write to a file, use a database, etc.
    }
    
    func retrieve(key: String) -> Storable? {
        // Perform disk retrieval operations to get the stored value
        // Example: Read from a file, query a database, etc.
        
        return nil
    }
    
    func remove(key: String) {
        // Perform disk removal operations to remove the stored value
        // Example: Delete a file, delete a database entry, etc.
    }
}

////Example Usage
////-------------
////Demonstrate how to use the above implementations with an example:
//
//let cache = Cache()
//let disk = Disk()
//
//cache.save(key: "testInt", value: 123)
//disk.save(key: "testString", value: "Hello")
//
//// Retrieve and use the stored values
//let retrievedInt = cache.retrieve(key: "testInt")
//let deserializedInt = Int.deserialize(from: retrievedInt)
//if let deserializedInt = deserializedInt {
//  print("Retrieved Int: \(deserializedInt)")
//}
//
//let retrievedString = disk.retrieve(key: "testString")
//let deserializedString = String.deserialize(from: retrievedInt)
//if let deserializedString = deserializedString {
//  print("Retrieved String: \(deserializedString)")
//}
