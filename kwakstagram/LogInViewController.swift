//
//  LogInViewController.swift
//  kwakstagram
//
//  Created by Joseph Kwak on 10/1/18.
//  Copyright © 2018 Joseph Kwak. All rights reserved.
//

import UIKit
import Parse
class LogInViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func onSignUp(_ sender: Any) {
        let newUsr = PFUser()
        newUsr.username = userNameField.text
        newUsr.password = passwordField.text
        newUsr.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print("Yayy, successfully created a new user!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print(error?.localizedDescription)
                if error?._code == 202{
                    print("User Name is already taken")
                }
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil{
                print("You are logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
