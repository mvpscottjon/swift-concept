import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    let container = UserDefaults.standard
    
    var wrappedValue: T {
        get{
            container.object(forKey: key) as? T ?? defaultValue
        }
        
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    // PropertyWrapper
    @UserDefault(key: "has_seen_view", defaultValue: false)
    static  var hasSeenView: Bool
}

// MARK: - Use cases

UserDefaults.hasSeenView = false
print(UserDefaults.hasSeenView)

UserDefaults.hasSeenView = true
print(UserDefaults.hasSeenView)
