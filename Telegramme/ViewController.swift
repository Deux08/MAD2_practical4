//
//  ViewController.swift
//  Telegramme
//
//  Created by Rasyid Waterkamp on 5/11/19.
//  Copyright © 2019 Rasyid Waterkamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    
    @IBAction func logInBtn(_ sender: Any) {
        
        if true {
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen //try without fulscreen
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

