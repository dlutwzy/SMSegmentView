//
//  SMSegmentAppearance.swift
//  SMSegmentViewController
//
//  Created by Si MA on 11/07/2016.
//  Copyright © 2016 si.ma. All rights reserved.
//

import UIKit

open class SMSegmentAppearance {
    
    // PROPERTIES
    open var segmentOnSelectionColour: UIColor {
        didSet {
            updateTouchDownBackgroundColor()
        }
    }
    open var segmentOffSelectionColour: UIColor{
        didSet {
            updateTouchDownBackgroundColor()
        }
    }
    open var segmentTouchDownColour: UIColor {
        get {
            return _segmentTouchDownColour
        }
    }
    
    open var titleOnSelectionColour: UIColor
    open var titleOffSelectionColour: UIColor
    
    open var titleOnSelectionFont: UIFont
    open var titleOffSelectionFont: UIFont
    
    open var titleGravity: SMSTitleGravity
    
    open var contentVerticalMargin: CGFloat
    
    
    // INITIALISER
    public convenience init() {
        self.init(contentVerticalMargin: 5.0,
                  segmentOnSelectionColour: UIColor.darkGray,
                  segmentOffSelectionColour: UIColor.gray,
                  titleOnSelectionColour: UIColor.white,
                  titleOffSelectionColour: UIColor.darkGray,
                  titleOnSelectionFont: UIFont.systemFont(ofSize: 17.0),
                  titleOffSelectionFont: UIFont.systemFont(ofSize: 17.0),
                  titleGravity: .right)
    }
    
    public init(contentVerticalMargin: CGFloat, segmentOnSelectionColour: UIColor, segmentOffSelectionColour: UIColor, titleOnSelectionColour: UIColor, titleOffSelectionColour: UIColor, titleOnSelectionFont: UIFont, titleOffSelectionFont: UIFont, titleGravity: SMSTitleGravity?) {
        
        self.contentVerticalMargin = contentVerticalMargin
        
        self.segmentOnSelectionColour = segmentOnSelectionColour
        self.segmentOffSelectionColour = segmentOffSelectionColour
        
        self.titleOnSelectionColour = titleOnSelectionColour
        self.titleOffSelectionColour = titleOffSelectionColour
        self.titleOnSelectionFont = titleOnSelectionFont
        self.titleOffSelectionFont = titleOffSelectionFont
        
        if let gravity = titleGravity {
            self.titleGravity = gravity
        } else {
            self.titleGravity = .right
        }
    }
    
    private func updateTouchDownBackgroundColor() {
        _segmentTouchDownColour = segmentOnSelectionColour.mix(color: segmentOffSelectionColour)
    }
    
    private var _segmentTouchDownColour: UIColor = UIColor.lightGray
}

extension UIColor {
    func mix(color: UIColor) -> UIColor {
        
        let selfHue = self.hue
        let inColorHue = color.hue
        
        return UIColor(hue: (selfHue.hue + inColorHue.hue)/2.0,
                       saturation: (selfHue.saturation + inColorHue.saturation)/2.0,
                       brightness: (selfHue.brightness + inColorHue.brightness)/2.0,
                       alpha: (selfHue.alpha + inColorHue.alpha)/2.0)
    }
    
    var hue: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        get {
            var h: CGFloat = 0.0
            var s: CGFloat = 0.0
            var b: CGFloat = 0.0
            var a: CGFloat = 0.0
            
            self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            
            return (h, s, b, a)
        }
    }
}
