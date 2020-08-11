//
//  SecondViewController.swift
//  PopupTransitioningDelegate_Example
//
//  Created by 李宗良 on 2020/8/11.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PopupTransitioningDelegate

class SecondViewController: UIViewController {

    var popupTransitioning: PopupTransitioning!
    var targetView: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createPopupTransitioning()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createPopupTransitioning()
    }
    
    func createPopupTransitioning() -> Void {
        popupTransitioning = PopupTransitioning(with: self, and: { (duration, presenting) -> (Void) in
            if presenting {
                self.targetView.frame = CGRect(x: 0, y: self.view.bounds.height - 200, width: self.view.bounds.width, height: 200)
            } else {
                self.targetView.frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: 200)
            }
        })
        popupTransitioning.backgroundColor = UIColor(white: 0, alpha: 0.75)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetView = UIView()
        targetView.backgroundColor = UIColor.white
        targetView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 200)
        view.addSubview(targetView)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
