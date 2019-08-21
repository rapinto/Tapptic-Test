//
//  DetailViewController+Presenter.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 20/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage

extension DetailViewController {
    
    // MARK: Presenter
    
    func updateView () {
        guard let elem = self.element else {
            return
        }
        
        self.updateView(element: elem)
    }
    
    func resetView () {
        self.elementTextLabel.text = nil
        self.elementImageView.image = nil
    }
    
    // MARK: Private
    
    private func updateView (element : Element) {
        self.updateImage(element: element)
        self.updateLabel(element: element)
    }
    
    private func updateImage(element: Element) {
        guard let imageURL = element.imageURL() else {
            return
        }
        
        self.elementImageView.af_setImage(withURL: imageURL)
    }
    
    private func updateLabel(element: Element) {
        self.elementTextLabel.text = element.text
    }
    
    
}
