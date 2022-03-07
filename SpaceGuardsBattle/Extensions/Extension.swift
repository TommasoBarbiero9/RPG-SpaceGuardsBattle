//
//  Extension.swift
//  SpaceGuardsBattle
//
//  Created by Tommaso Barbiero on 08/02/22.
//

import Foundation
import SpriteKit

struct ScreenSize {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
    static let size         = CGSize(width: ScreenSize.width, height: ScreenSize.height)
}

struct DeviceType {
    static let isiPhone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone6s = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone6sPlus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone7Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone7 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone8 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
    static let isiPadPro = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1366.0
    static let isiPhone8Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
}

public extension SKSpriteNode {
    
    func scaleTo(screenWidthPercentage: CGFloat) {
        let aspectRatio = self.size.height / self.size.width
        self.size.width = ScreenSize.width * screenWidthPercentage
        self.size.height = self.size.width * aspectRatio
    }
    
}

extension NSNotification.Name {
    static let goToBackground = Notification.Name(rawValue: "goToBackground")
}

extension CGPoint {
    func distance(point: CGPoint) -> CGFloat {
        return abs(CGFloat(hypotf(Float(point.x - x), Float(point.y - y))))
    }
}

extension UIView {
    func shake() {
        self.transform = CGAffineTransform(translationX: 0, y: 30)
        UIView.animate(withDuration: 20, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * -2)
        rotation.duration = 15
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

