//
//  ViewController.swift
//  DynamicsTest
//
//  Created by Francisco de la Pena on 3/25/15.
//  Copyright (c) 2015 ___TwisterLabs___. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    
    var gravity: UIGravityBehavior!
    
    var collision: UICollisionBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        square.backgroundColor = UIColor.blueColor()
        
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        gravity = UIGravityBehavior(items: [square])
        
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        
        collision.translatesReferenceBoundsIntoBoundary = true

        collision.collisionDelegate = self
        
        animator.addBehavior(collision)
        
        
    }

    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        
        // println(view.frame)
        //  println(p)
        
        var x = p.x
        
        var y = p.y
        
        var mult:Double = 10

        if y <= 3 {             // Upper Boundary
            
            println("Collision Detected: UP")
            
//            gravity.gravityDirection = CGVector(dx: CGFloat(Double(arc4random_uniform(21)) / 10.0 - 1), dy: CGFloat(Double(arc4random_uniform(11)) / 10.0))
            
            gravity.gravityDirection = CGVector(dx: CGFloat(mult * (Double(arc4random_uniform(21)) / 10.0 - 1)), dy: CGFloat(mult * (Double(arc4random_uniform(11)) / 10.0)))
            
        } else if y >= 565 {    // Lower Boundary
            
//            gravity.gravityDirection = CGVector(dx: CGFloat(Double(arc4random_uniform(21)) / 10.0 - 1), dy: CGFloat(Double(arc4random_uniform(11)) / 10.0 - 1))
            
            gravity.gravityDirection = CGVector(dx: CGFloat(mult * (Double(arc4random_uniform(21)) / 10.0 - 1)), dy: CGFloat(mult * (Double(arc4random_uniform(11)) / 10.0 - 1)))
            
        } else if x <= 3 {      // Left Boundary
            
            println("Collision Detected: Left")
            
//            gravity.gravityDirection = CGVector(dx: CGFloat(Double(arc4random_uniform(11)) / 10.0), dy: CGFloat(Double(arc4random_uniform(21)) / 10.0 - 1))
            
            gravity.gravityDirection = CGVector(dx: CGFloat(mult * (Double(arc4random_uniform(11)) / 10.0)), dy: CGFloat(mult * (Double(arc4random_uniform(21)) / 10.0 - 1)))
            
        } else if x >= 317 {    // Right Boundary
            
            println("Collision Detected: Right")
 
//            gravity.gravityDirection = CGVector(dx: CGFloat(Double(arc4random_uniform(11)) / 10.0 - 1), dy: CGFloat(Double(arc4random_uniform(21)) / 10.0 - 1))
            
            gravity.gravityDirection = CGVector(dx: CGFloat(mult * (Double(arc4random_uniform(11)) / 10.0 - 1)), dy: CGFloat(mult * (Double(arc4random_uniform(21)) / 10.0 - 1)))
            
        }
        
        println("New Direction: \([gravity.gravityDirection.dx, gravity.gravityDirection.dy)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

