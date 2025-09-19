
import Foundation

@propertyWrapper
struct DarkModeSetting{
    private let key = "darkModeEnabled"
    private var value: Bool
    
    init(){
        self.value = UserDefaults.standard.bool(forKey: key)
        
    }
    
    var wrappedValue: Bool{
        get{
            UserDefaults.standard.bool(forKey: key)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
