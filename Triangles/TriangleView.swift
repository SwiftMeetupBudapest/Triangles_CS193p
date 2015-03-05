//
//  TriangleView.swift
//  TrianglesExample
//
//  Created by Géza Mikló on 02/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleView: UIView {

    //Has to be CGFloat, Double value won't show up in Inspector
    @IBInspectable
    var rotation: CGFloat = 0 {
        didSet {
            transform = CGAffineTransformMakeRotation(rotation)
            setNeedsDisplay()
        }
    }

    @IBInspectable
    var scale : CGFloat = 0.5 {
            didSet {
                setNeedsDisplay()
            }
        }
    
    func scaleAction(gesture: UIPinchGestureRecognizer) {
        scale = gesture.scale * scale
        gesture.scale = 1
    }

    func rotateAction(gesture: UIRotationGestureRecognizer) {
        switch gesture.state {
        case .Changed:
            rotation += gesture.rotation
            gesture.rotation = 0
        default:
            break;
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath();

        let biggerDim = max(self.bounds.size.width, self.bounds.size.height)
        let smallerDim = min(self.bounds.size.width, self.bounds.size.height)
        
        let w = (smallerDim ?? 320) * scale
        let h = (biggerDim ?? 480) * scale
        let hCenter = w / 2
        let vFourth = h / 4

        path.moveToPoint(CGPoint(x: CGFloat(hCenter), y: CGFloat(vFourth)))
        path.addLineToPoint(CGPoint(x: CGFloat(w * 0.9), y: CGFloat(h*0.9)))
        path.addLineToPoint(CGPoint(x: CGFloat(w*0.1), y: CGFloat(h*0.9)))
        path.lineWidth = 3
        
        path.closePath()
        UIColor.redColor().setFill()
        UIColor.greenColor().setStroke()
        
        path.stroke()
        path.fill()

    }

}
