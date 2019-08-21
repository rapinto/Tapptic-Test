//
//  MasterViewController+Presenter.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import UIKit

extension MasterViewController {
    
    // MARK: UITableViewDataSource + UITableViewDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let element = self.elements?[indexPath.row] else {
            return UITableViewCell(style: .default, reuseIdentifier: "defaultCell_Identifier")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ElementTableViewCell.identifier,
                                                       for: indexPath) as? ElementTableViewCell else {
                                                        return UITableViewCell(style: .default, reuseIdentifier: "defaultCell_Identifier")
        }
        
        cell.update(element: element)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.updateDelegate(indexPath: indexPath)
        
        self.showDetailViewController()
    }
    
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        guard let elementCell = cell as? ElementTableViewCell else {
            return
        }
        
        guard let element = self.elements?[indexPath.row] else {
            return
        }
        
        let currentSelectedElement = self.delegate?.currentSelected()
        
        let selectedCell = currentSelectedElement != nil &&
            currentSelectedElement?.name == element.name
        elementCell.setSelected(selectedCell, animated: false)
    }
    
    // MARK: Internal
    
    internal func updateDelegate(indexPath: IndexPath) {
        guard let element = self.elements?[indexPath.row] else {
            return
        }
        
        self.delegate?.select(element: element)
    }
    
    func showDetailViewController () {
        guard let detailViewController = delegate as? UIViewController else {
            return
        }
        
        guard let navigationController = detailViewController.navigationController else {
            return
        }
        
        if (self.splitViewController?.viewControllers.count ?? 0) < 2 {
            splitViewController?.showDetailViewController(navigationController, sender: self)
        }
    }
    
    func didRequestElements() {
        self.tableView?.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // update master
        self.tableView?.selectRow(at: indexPath,
                                  animated: true,
                                  scrollPosition: .none)
        
        // update detail
        self.tableView?.delegate?.tableView?(self.tableView,
                                             didSelectRowAt: indexPath)
    }
}
