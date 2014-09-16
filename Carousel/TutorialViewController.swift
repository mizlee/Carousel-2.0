//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Lee Cline on 9/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var welcomeOne: UIImageView!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

       scrollView.contentSize = CGSize(width: 1280, height: 568)
        

}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func scrollViewDidScroll (){(scrollView: UIScrollView)}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
