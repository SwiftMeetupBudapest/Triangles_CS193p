//
//  ViewController.swift
//  TrianglesExample
//
//  Created by Géza Mikló on 02/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

class TrianglesViewController: UIViewController {

    @IBOutlet weak var triangleView: TriangleView! {
        didSet {
            // Add gesture recognizers in a way that the View will handle the gestures
            triangleView.addGestureRecognizer(UIPinchGestureRecognizer(target: triangleView, action: "scaleAction:"))
            triangleView.addGestureRecognizer(UIRotationGestureRecognizer(target: triangleView, action: "rotateAction:"))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

