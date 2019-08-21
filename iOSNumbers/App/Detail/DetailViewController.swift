//
//  DetailViewController.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, MasterViewControllerDelegate {
    
    // MARK: Attributes
    
    @IBOutlet weak var elementImageView: UIImageView!
    
    @IBOutlet weak var elementTextLabel: UILabel!
    
    var element : Element?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeNavigationItems()
        
        if let elem = self.element {
            self.resetView()
            self.requestData(element: elem)
        }
    }

    // MARK: MasterViewControllerDelegate
    
    func select(element : Element) {
        self.element = element
        
        self.title = element.name
        
        if self.isViewLoaded {
            self.resetView()
            self.requestData(element: element)
        }
    }
    
    func currentSelected() -> Element? {
        return self.element
    }
    
    // MARK: Private
        
    private func initializeNavigationItems() {
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
    }
}
