//
//  DropItBehavior.swift
//  DropIt
//
//  Created by Jeff Greenberg on 7/2/15.
//  Copyright (c) 2015 Jeff Greenberg. All rights reserved.
//

import UIKit

class DropItBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let newCollider = UICollisionBehavior()
        newCollider.translatesReferenceBoundsIntoBoundary = true
        return newCollider
        }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let newBehavior = UIDynamicItemBehavior()
        newBehavior.allowsRotation = false
        newBehavior.elasticity = 0.75
        return newBehavior
    }()


    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        collider.addItem(drop)
        gravity.addItem(drop)
        dropBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collider.removeItem(drop)
        dropBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }
}
