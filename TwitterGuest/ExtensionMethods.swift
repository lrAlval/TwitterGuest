//
//  ExtensionMethods.swift
//  TwitterGuest
//
//  Created by Robert on 6/5/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar{
    
    func TransparentNavigationBar(){
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
    
}
