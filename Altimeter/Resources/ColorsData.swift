//

import UIKit

//extension UIColor {
//    convenience init(hex: String) {
//        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//        var int: UInt64 = 0
//        Scanner(string: hexString).scanHexInt64(&int)
//        let a, r, g, b: UInt64
//        switch hexString.count {
//        case 3: // RGB (12-bit)
//            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
//        case 6: // RGB (24-bit)
//            (a, r, g, b) = (255, (int >> 16), (int >> 8 & 0xFF), (int & 0xFF))
//        case 8: // ARGB (32-bit)
//            (a, r, g, b) = (int >> 24, (int >> 16 & 0xFF), (int >> 8 & 0xFF), (int & 0xFF))
//        default:
//            (a, r, g, b) = (255, 0, 0, 0)
//        }
//        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
//    }
//}


typealias colorData = UIColor

extension colorData {
    typealias HexComponents = (alpha: UInt64, red: UInt64, green: UInt64, blue: UInt64)
    
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)
        let components: HexComponents
        
        switch hexString.count {
        case 3: // RGB (12-bit)
            components = (alpha: 255, red: (int >> 8) * 17, green: (int >> 4 & 0xF) * 17, blue: (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            components = (alpha: 255, red: (int >> 16), green: (int >> 8 & 0xFF), blue: (int & 0xFF))
        case 8: // ARGB (32-bit)
            components = (alpha: (int >> 24), red: (int >> 16 & 0xFF), green: (int >> 8 & 0xFF), blue: (int & 0xFF))
        default:
            components = (alpha: 255, red: 0, green: 0, blue: 0)
        }
        
        self.init(
            red: CGFloat(components.red) / 255,
            green: CGFloat(components.green) / 255,
            blue: CGFloat(components.blue) / 255,
            alpha: CGFloat(components.alpha) / 255
        )
    }
}
