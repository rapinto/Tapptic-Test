//
//  Element.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import Foundation

class Element {
    
    // MARK: Attributes
    
    public let name : String

    public var image : String?

    public var text : String?
    
    // MARK: Init
    
    init(name : String) {
        self.name = name
    }
    
    // MARK: Public
    
    func parse (image : String? = nil, text : String? = nil) {
        self.image = image
        self.text = text
    }
}

