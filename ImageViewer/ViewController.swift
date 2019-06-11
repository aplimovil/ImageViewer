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
    
    let images = ["CradleMountain.JPG","Laguna69.JPG","PatagoniaSky.JPG"]
    var imageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 =
            UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGestureRecognizer2.numberOfTouchesRequired = 2
        tapGestureRecognizer2.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGestureRecognizer2)
    }
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        imageView.center = CGPoint(x:imageView.center.x + translation.x,y:imageView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if (sender.numberOfTouchesRequired == 1) {
            imageNo += 1
            if imageNo == images.count {imageNo = 0}
        } else if sender.numberOfTouchesRequired == 2 {
            imageNo -= 1
            if imageNo == -1 {imageNo = images.count - 1}
        }
        imageView.image = UIImage(named: images[imageNo])
    }
    
}
extension ViewController:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

