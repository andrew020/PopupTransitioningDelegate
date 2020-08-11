//
//  PopupTransitioningDelegate.swift
//  Pods
//
//  Created by 李宗良 on 2020/8/11.
//

import UIKit

public typealias PopupAnimation = (_ duration: TimeInterval, _ presenting: Bool) -> (Void)


/// Should be created in initailize funcation in UIViewController
public class PopupTransitioning: NSObject, UIViewControllerTransitioningDelegate {
    
    public var backgroundColor: UIColor = UIColor(white: 0, alpha: 0.5)
    private var popupAnimationBlock: PopupAnimation? = nil
    private weak var viewcontroller: UIViewController!
    private weak var presentingVC: UIViewController?
    
    public init(with viewcontroller: UIViewController, and popupAnimationBlock: PopupAnimation?) {
        super.init()
        self.viewcontroller = viewcontroller
        self.viewcontroller.modalPresentationStyle = .custom
        self.viewcontroller.definesPresentationContext = true
        self.viewcontroller.transitioningDelegate = self
        self.popupAnimationBlock = popupAnimationBlock
    }
    
    //MARK: UIViewControllerTransitioningDelegate
    
    private func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentingVC = presenting
        presented.view.backgroundColor = backgroundColor
        return PopupViewControllerTransition(fromVC: presenting, toVC: presented, popupAnimationBlock: popupAnimationBlock)
    }

    private func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let presentingVC = presentingVC {
            let transition = PopupViewControllerTransition(fromVC: viewcontroller, toVC: presentingVC, popupAnimationBlock: popupAnimationBlock)
            transition.presenting = false
            return transition
        }
        return nil
    }
}

private class PopupViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {

    var popupAnimationBlock: PopupAnimation? = nil
    var presenting = true
    weak var fromVC : UIViewController!
    weak var toVC: UIViewController!

    override init() {

    }

    init(fromVC: UIViewController, toVC: UIViewController, popupAnimationBlock: PopupAnimation?) {
        self.fromVC = fromVC
        self.toVC = toVC
        self.popupAnimationBlock = popupAnimationBlock
    }

    //MARK: UIViewControllerAnimatedTransitioning
    
    @objc func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    @objc func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
        if (presenting) {
            containerView.addSubview(toVC.view!)
            let original = toVC.view.backgroundColor
            toVC.view.backgroundColor = original?.withAlphaComponent(0)
            UIView.animate(withDuration: duration, animations: {
                self.toVC.view.backgroundColor = original
                self.popupAnimationBlock?(duration, self.presenting)
            }, completion: { (completed) in
                if completed {
                    self.toVC.view.alpha = 1
                    transitionContext.completeTransition(true)
                }
            })
        } else {
            UIView.animate(withDuration: duration, animations: {
                self.fromVC.view.backgroundColor = self.fromVC.view.backgroundColor?.withAlphaComponent(0)
                self.popupAnimationBlock?(duration, self.presenting)
            }, completion: { (completed) in
                if completed {
                    transitionContext.completeTransition(true)
                }
            })
        }
    }

}
