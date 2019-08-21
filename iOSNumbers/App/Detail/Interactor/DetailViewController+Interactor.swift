//
//  DetailViewController+Interactor.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import Foundation

extension DetailViewController {
    
    // MARK: Request
    
    func requestData(element : Element) {
        Element.sendGetElement(element: element,
                               success: {
            self.updateView()
        }) { (error : Error) in
            print(error)
        }
    }
}
