//
//  ViewController.swift
//  PopupTransitioningDelegate
//
//  Created by adx-developer on 08/11/2020.
//  Copyright (c) 2020 adx-developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showSecondVC(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        var viewcontroller: UIViewController!
        if #available(iOS 13.0, *) {
            viewcontroller = storyboard.instantiateViewController(identifier: "SecondViewController")
        } else {
            viewcontroller = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        }
        present(viewcontroller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

