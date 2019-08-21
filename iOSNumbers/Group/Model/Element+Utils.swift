//
//  Element+Utils.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import Foundation

extension Element {
    
    // MARK: Utils
    
    func imageURL() -> URL? {
        guard let image = self.image else {
            return nil
        }
        
        let imageURL = URL(string: image)
        
        return imageURL
    }
    
    static func parse(array : Array<Dictionary<AnyHashable, Any>>) -> [Element] {
        var elements = [Element]()
        
        for dictionary in array {
            if let element = Element.parse(dictionary: dictionary) {
                elements.append(element)
            }
        }
        
        return elements
    }
    
    static func parse(dictionary : Dictionary<AnyHashable, Any>) -> Element? {
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        let element = Element(name: name)
        element.update(dictionary: dictionary)
        
        return element
    }
    
    func update(dictionary : Dictionary<AnyHashable, Any>) {
        if let text = dictionary["text"] as? String {
            self.text = text
        }        
        
        if let image = dictionary["image"] as? String {
            self.image = image
        }
    }
}
