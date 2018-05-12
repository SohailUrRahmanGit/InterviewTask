//
//  ViewController.swift
//  MiviTechTask
//
//  Created by Sohailurrahman S on 11/05/18.
//  Copyright © 2018 SohailUrRahman. All rights reserved.
//

import UIKit

class MVLoginViewController: UIViewController,UITextFieldDelegate {
    let jsonHelperObj = JsonHelper()
    var userInfoJson : NSDictionary = [:]
    
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let username = self.emailTextFieldOutlet.text
        let password = self.passwordTextFieldOutlet.text
        let userCollectionObject = jsonHelperObj.getJsonData()

        if userCollectionObject.status == kPass {
            if ((username) != "") && ((password) != "") {
                     if ((username) == "test@mivi.com") && ((password) == "123456")
                     {
                        userInfoJson = userCollectionObject.returnData
                        performSegue(withIdentifier: ksegueIdentifierForUserInformation, sender: self)
                        print("Login success")
                     }
                     else {
                        let alert = UIAlertController(title: "Failed", message: "Please enter a valid credentials.", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                        
                        self.present(alert, animated: true)
                }
            }
                
            else {
                let alert = UIAlertController(title: "Failed", message: "Please enter a valid credentials.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
      
                
        
           
        
        
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    let informationViewContoller = segue.destination as? MVInformationScreenController
    informationViewContoller?.userDetailsJson = userInfoJson

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

