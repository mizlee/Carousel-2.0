//
//  SignInViewController.swift
//  Carousel
//
//  Created by Lee Cline on 9/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet var tapListener: UITapGestureRecognizer!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var loginForm: UIView!
   
    @IBOutlet weak var emailField: UITextField!
   
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signinButtons: UIView!

    @IBOutlet weak var signinButton: UIButton!
    
    var loadingAlert = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
}

    @IBAction func onBackButton(sender: AnyObject) { dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func keyboardWillShow(notification: NSNotification!) {
    loginForm.frame.origin.y = loginForm.frame.origin.y-70
    signinButtons.frame.origin.y = signinButtons.frame.origin.y-260
    }
    
    func keyboardWillHide(notification: NSNotification!) {
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    @IBAction func onTap(sender: AnyObject) {view.endEditing(true)
    }
    
    @IBAction func onSigninButton(sender: AnyObject) {
        
        if (self.emailField.text.isEmpty && self.passwordField.text.isEmpty) {
          UIAlertView(title: "Oops.", message: "Please enter an email or password", delegate: nil, cancelButtonTitle: "OK").show()
        }
        
        
        else {
            loadingAlert.show()
            delay(2){
            //stuff in here is run after two seconds
            if (self.emailField.text == "t" && self.passwordField.text == "p") {
            self.performSegueWithIdentifier("loginSegue", sender: self)
            }
                
            else {
            UIAlertView(title: "Phoo.", message: "Wrong email or password", delegate: nil, cancelButtonTitle: "OK").show()
            }

            self.loadingAlert.dismissWithClickedButtonIndex(0, animated: true)
            //not sure why this has to go after the others?? but it works..
            }
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
