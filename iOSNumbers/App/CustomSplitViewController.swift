//
//  CustomSplitViewController.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 21/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import UIKit

class CustomSplitViewController : UISplitViewController, UISplitViewControllerDelegate {
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.preferredDisplayMode = .primaryOverlay
    }
    
    // MARK: UISplitViewControllerDelegate
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
