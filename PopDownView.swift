//
//  PopUpView.swift
//  SwiftDropMenu
//
//  Created by Navarifar, Maten on 3/25/15.
//  Copyright (c) 2015 Navarifar, Maten. All rights reserved.
//  Credits: 
//  http://iphonedev.tv/blog/2014/12/15/create-an-ibdesignable-uiview-subclass-with-code-from-an-xib-file-in-xcode-6 
//  was a great source in helping me tie view to the nib. You can see some of that code in here ;)
//

import Foundation
import UIKit

class PopDownView : UIView {

    //Need to store the actual frame size, since we resize the frame to have a height of 0 when initialized
    var actualFrame: CGRect!
    
    var animationOpenSpeed = 0.7
    var animationCloseSpeed = 0.7
    
    //speed at which subviews fade in and out
    var animationSubviewFadeSpeed = 0.3
    
    var doneAnimating = false
    
    
    //The grey backdrop behind the main view
    var stage: UIView?
    
    var view: UIView?
    
    init(frame: CGRect, withNibNamed: String) {
        
        super.init(frame: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: 0))
        self.actualFrame = frame
        self.view = loadViewFromNib(withNibNamed)
        self.view!.frame = self.bounds
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        addSubview(self.view!)
        self.hideSubviews()

    }
    
    required init(coder aDecoder: NSCoder) {
        
        fatalError("Use Init(frame: CGRect, withNibNamed: String) instead. No support for this init as of yet.")
    }
    
    
    private func loadViewFromNib(name: String) -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: name, bundle: bundle)
        
        // Assumes UIView is top level and only object in Custom Xib file
        let pview = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        return pview
    }
    
    

}

// MARK: MainViewSubviews
extension PopDownView {

    private func hideSubviews() {
        
        let subviews = self.view!.subviews
        for view in subviews{
            var component: UIView? = view as? UIView
            component?.alpha = 0
        }
        
    }
    
    private func showSubviews() {
        
        let subviews = self.view!.subviews
        for view in subviews{
            var component: UIView? = view as? UIView
            component?.alpha = 1
        }
        
    }

}

// MARK: Animation
extension PopDownView {
    
    @objc private func tapStage() {
        
        self.closeAndDestroy()
    }
    
    func open() {
        
        self.stage = UIView(frame: self.superview!.bounds)
        self.stage!.backgroundColor = UIColor.lightGrayColor()
        self.stage!.alpha = 0
        self.superview!.addSubview(self.stage!)
        self.stage!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapStage"))
        self.superview!.bringSubviewToFront(self)
        
        
        UIView.animateWithDuration(self.animationOpenSpeed, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.stage!.alpha = 0.6
            
            self.frame = self.actualFrame
            
            }, completion: { (finished) -> Void in
                self.doneAnimating = true
                UIView.animateWithDuration(self.animationSubviewFadeSpeed, animations: { () -> Void in
                    self.showSubviews()
                })
                
        })
    }
    
    private func closeAndDestroy() {

        UIView.animateWithDuration(self.animationSubviewFadeSpeed, animations: { () -> Void in
            let subviews = self.view!.subviews
            self.hideSubviews()
        }) { (finished) -> Void in
            
            
            UIView.animateWithDuration(self.animationCloseSpeed, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                self.stage!.alpha = 0
                let newFrame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: 0)
                self.frame = newFrame
                
                }, completion: { (finished) -> Void in
                    self.doneAnimating = true
                    self.stage!.removeFromSuperview()
                    self.removeFromSuperview()
            })
            
        }

    }

    
}
