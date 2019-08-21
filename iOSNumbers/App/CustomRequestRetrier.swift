//
//  CustomRequestRetrier.swift
//  iOSNumbers
//
//  Created by Raphaël PINTO on 21/08/2019.
//  Copyright © 2019 LDLC. All rights reserved.
//

import Foundation
import Alamofire

class CustomRequestRetrier : RequestRetrier {
    
    // MARK: RequestRetrier
    
    func should(_ manager: SessionManager,
                retry request: Request,
                with error: Error,
                completion: @escaping RequestRetryCompletion) {
        guard self.isNetworkError(request: request) == true else {
            completion(false, 0)
            return
        }
        
        guard let rootViewController = UIApplication.shared.delegate?.window??.rootViewController else {
            completion(false, 0)
            return
        }
        
        let alertController = UIAlertController(title: "Network error",
                                                message: "Retry?",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes",
                                      style: .default,
                                      handler: { action in
                                        completion(true, 2)
        })
        alertController.addAction(yesAction)
        
        
        let noAction = UIAlertAction(title: "No",
                                     style: .cancel,
                                     handler: { action in
                                        alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(noAction)
        
        DispatchQueue.main.async {
            rootViewController.present(alertController,
                                       animated: true,
                                       completion: nil)
        }
        
    }
    
    // MARK: Private
    
    private func isNetworkError (request: Request) -> Bool {
        guard let error = request.task?.error else {
            return false
        }
        
        let nserror = error as NSError
        let statusCode = nserror.code
        
        if statusCode == NSURLErrorTimedOut ||
            statusCode == NSURLErrorCannotFindHost ||
            statusCode == NSURLErrorNotConnectedToInternet ||
            statusCode == NSURLErrorNetworkConnectionLost {
            return true
        }
        
        return false
    }
}
