//
//  MasterViewController+Interactor.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

extension MasterViewController {
    
    // MARK: Request
    
    func requestData() {
        Element.sendGetElements(success: { (elements : [Element]) in
            self.elements = elements
            
            self.didRequestElements()            
        }) { (error : Error) in
            print(error)
        }
    }
}
