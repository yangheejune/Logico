//
//  CategoryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 14..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Segmentio

private let animateDuration: TimeInterval = 0.6

class CategoryViewController: UIViewController {
    
    fileprivate var currentViewController: UIViewController?
    var style = SegmentioStyle.onlyLabel
    
    let semaphore = DispatchSemaphore(value: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        presentController(controller(style))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func presentController(_ controller: UIViewController) {
        if let _ = currentViewController {
            removeCurrentViewController()
        }
        
        addChildViewController(controller)
        view.addSubview(controller.view)
        currentViewController = controller
        controller.didMove(toParentViewController: self)
    }
    
    fileprivate func controller(_ style: SegmentioStyle) -> MirrorViewController {
        let controller = MirrorViewController.create()
        controller.segmentioStyle = style
        controller.view.frame = view.bounds
        return controller
    }
    
    fileprivate func removeCurrentViewController() {
        currentViewController?.willMove(toParentViewController: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParentViewController()
    }
    
    fileprivate func swapCurrentController(_ controller: UIViewController) {
        currentViewController?.willMove(toParentViewController: nil)
        addChildViewController(controller)
        view.addSubview(controller.view)
        
        UIView.animate(
            withDuration: animateDuration,
            animations: {
                controller.view.alpha = 1
                self.currentViewController?.view.alpha = 0
        },
            completion: { _ in
                self.currentViewController?.view.removeFromSuperview()
                self.currentViewController?.removeFromParentViewController()
                self.currentViewController = controller
                self.currentViewController?.didMove(toParentViewController: self)
        }
        )
    }
    
    func swapViewControllers(_ style: SegmentioStyle) {
        swapCurrentController(controller(style))
    }
}
