//
//  ViewController.swift
//  Carousel
//
//  Created by Lee Cline on 9/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var contentView: UIImageView!
                            
    @IBOutlet weak var tile1View: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    func updateViewTransformsWithOffset(offset : Float) {}
     //what is this all about?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    scrollView.contentSize = contentView.image!.size

    scrollView.delegate = self
        
    scrollView.sendSubviewToBack(contentView)
        //what is this all about?

        func scrollViewDidScroll(scrollView: UIScrollView!){
        var offset = Float(scrollView.contentOffset.y)
            // content offset: 0->568
            // x offset: -30->0
            // y offset: -285->0
            
            var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
            var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
            var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
            var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
            
            
            tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
            tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))}
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

