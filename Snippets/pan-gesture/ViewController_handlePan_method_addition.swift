/**
 *
 * Applications development for mobile devices
 * -------------------------------------------
 *
 * View Controller for handling App gestures
 *
 * @author Francisco Martinez
 *
 * This example is based on the source code from the book
 * of Craig Grummit - iOS Development with Swift
 * Copyright © 2016 Craig Grummitt. All rights reserved.
 *
 *
 *
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        //Perform an image translation according to pan gesture move from user
        let translation = sender.translation(in: self.view)
        imageView.center = CGPoint(x: imageView.center.x + translation.x,
                                   y: imageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
}


