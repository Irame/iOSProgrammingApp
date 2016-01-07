//
//  ViewController.swift
//  GesturesTutorial
//
//  Copyright (c) 2015 Flori & Andy. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    @IBOutlet weak var gestureName: UILabel!

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var pinchView: UIView!
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var swipeView: UIView!
    
    var rotation = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tap = UITapGestureRecognizer(target: self, action: "tappedView:")
        tap.numberOfTapsRequired = 1
        tapView.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: "swipedView:")
        swipeView.addGestureRecognizer(swipe)
        
        let longpress = UILongPressGestureRecognizer(target: self, action: "longPressedView:")
        longPressView.addGestureRecognizer(longpress)
    }
    
    // Recognizers that have been added by code
    func tappedView(recognizer : UITapGestureRecognizer) {
        print("tapped")
        showGestureName("Tapped")
    }
    
    func swipedView(recognizer : UISwipeGestureRecognizer) {
        print("Swipe ")
        showGestureName("Swiped")

    }
    
    func longPressedView(recognizer : UILongPressGestureRecognizer) {
        print("Longpress ")
        showGestureName("LongPress")
    }
    
    // Recognizers that have been added by interface builder
    @IBAction func rotatedView(sender: UIRotationGestureRecognizer) {
        print("Rotate ")
        showGestureName("Rotated")
    }
    
    @IBAction func draggedView(sender: UIPanGestureRecognizer) {
        print("Drag ")
        showGestureName("Dragged")
    }
    
    @IBAction func pinchedView(sender: UIPinchGestureRecognizer) {
        print("Pinch ")
        showGestureName("Pinch")
    }
    
    // Other functions
    func showAlertViewControllerWith(title: String, message: String) {
        let tapAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    func showGestureName(name: String) {
        gestureName.text = name
        UIView.animateWithDuration(1.0,
            animations: { self.gestureName.alpha = 1.0 },
            completion: { _ in
                UIView.animateWithDuration(1.0) { self.gestureName.alpha = 0 }
        })
    }
}

