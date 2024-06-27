

import UIKit


final class CustomFontManager {
    
    // MARK: - Custom Fonts
    
//    private class func boldFont(size: CGFloat) -> UIFont {
//        return UIFont.boldSystemFont(ofSize: size)
//    }

    private class func boldSemiFontManager(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplaySemibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }


    
    private class func customRegularFontManger(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplayRegular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }

    
    // MARK: - Font Sizes
    
    enum FontSize {
        static let child: CGFloat = 10
        static let small: CGFloat = 12
        static let medium: CGFloat = 15
        static let meduimXL: CGFloat = 18
        static let large: CGFloat = 20
        static let extraLarge: CGFloat = 25
        static let xxlextraLarge: CGFloat = 130
    }
    
    // MARK: - Font Styles
    static var smallRegular: UIFont {
        return CustomFontManager.customRegularFontManger(size: FontSize.large)
    }
    
    
    
    static var boldchild: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.child)
    }
    
    static var boldSmall: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.small)
    }
    
    static var semiBoldMedium: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.medium)
    }
    
    static var semiBoldMediumXL: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.meduimXL)
    }
    
    
    static var regularLarge: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.large)
    }
    
    static var extraLarge: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.extraLarge)
    }
    
    static var xxlextraLarge: UIFont {
        return CustomFontManager.boldSemiFontManager(size: FontSize.xxlextraLarge)
    }
    
    // Add more font styles as needed
    
}
