//
//  CustomPopAnimator.swift
//  Lesson1
//
//  Created by Marcus on 28.03.2021.
//

import UIKit

class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame

        let  transA = CGAffineTransform(translationX: destination.view.frame.size.width/2,y: destination.view.frame.size.height/2);
        let  rotation = CGAffineTransform(rotationAngle: CGFloat.pi/2);
        let  transB = CGAffineTransform(translationX: -destination.view.frame.size.width/2,y: -destination.view.frame.size.height/2);


        let transform = transA.concatenating(rotation).concatenating(transB);

        destination.view.transform = source.view.transform.concatenating(transform)

        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: [],
            animations: {
                //1
                UIView.addKeyframe(
            withRelativeStartTime: 0,
                    relativeDuration: 1,
            animations: {
                let  transA = CGAffineTransform(translationX: source.view.frame.size.width/2,y: source.view.frame.size.height/2);
                let  rotation = CGAffineTransform(rotationAngle: -CGFloat.pi/2);
                let  transB = CGAffineTransform(translationX: -source.view.frame.size.width/2,y: -source.view.frame.size.height/2);

                let transform = transA.concatenating(rotation).concatenating(transB);

                source.view.transform = source.view.transform.concatenating(transform)
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
            relativeDuration: 1,
            animations: {
                destination.view.transform = .identity
                    })
                
            },
            completion: {finished in
                let finishedAndNotCancelled = finished && !transitionContext.transitionWasCancelled
                if finishedAndNotCancelled {
                    source.removeFromParent()
                    
                } else if transitionContext.transitionWasCancelled{
                    destination.view.transform = .identity
                }
                transitionContext.completeTransition(finishedAndNotCancelled)
                
            })
    }
}
