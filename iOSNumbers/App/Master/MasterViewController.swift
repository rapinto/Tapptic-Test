//
//  MasterViewController.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate : class {
    func select(element : Element)
    
    func currentSelected() -> Element?
}

class MasterViewController: UITableViewController {
    
    // MARK: Attributes
    
    var elements : [Element]?
    
    weak var delegate : MasterViewControllerDelegate?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDelegate()
        
        if self.elements == nil {
            self.requestData()
        }
    }
    
    // MARK: Private
    
    private func setDelegate() {
        let viewControllerCount = self.splitViewController?.viewControllers.count ?? 0
        if viewControllerCount > 1 {
            guard let navigationController = self.splitViewController?.viewControllers[1] as? UINavigationController else {
                return
            }
            
            guard let viewController = navigationController.viewControllers.first as? DetailViewController else {
                return
            }
            
            self.delegate = viewController
        }
    }
}

