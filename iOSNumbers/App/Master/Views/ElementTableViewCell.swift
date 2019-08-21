//
//  ElementTableViewCell.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ElementTableViewCell : UITableViewCell {
    
    // MARK: Attributes
    
    public static let identifier = "ElementTableViewCell_Identifier"
    
    @IBOutlet weak var elementImageView: UIImageView!
    
    @IBOutlet weak var elementNameLabel: UILabel!
    
    // MARK: UITableViewCell
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            self.setSelectedDisplayMode()
        }
        else {
            self.setDefaultDisplayMode()
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {        
        if highlighted {
            self.setHighlightedDisplayMode()
        }
        else {
            self.setDefaultDisplayMode()
        }
    }
    
    // MARK: Public
    
    func update(element: Element) {
        self.reset()
        
        self.updateImage(element: element)
        self.updateLabel(element: element)
    }
    
    // MARK: Private
    
    private func reset () {
        self.elementNameLabel.text = nil
        self.elementImageView.image = nil
    }
    
    private func updateImage(element: Element) {
        guard let imageURL = element.imageURL() else {
            return
        }
        
        self.elementImageView.af_setImage(withURL: imageURL)
    }
    
    private func updateLabel(element: Element) {
        self.elementNameLabel.text = element.name
    }
    
    private func setSelectedDisplayMode () {
        self.backgroundColor = .red
        self.elementNameLabel.textColor = .white
    }
    
    private func setHighlightedDisplayMode () {
        self.backgroundColor = .blue
        self.elementNameLabel.textColor = .white
    }
    
    private func setDefaultDisplayMode () {
        self.backgroundColor = .clear
        self.elementNameLabel.textColor = .black
    }
}
