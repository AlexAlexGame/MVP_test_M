//
//  RootWireframe.swift
//  VIPER
//
//  Created by alex on 03.02.16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
  
    
    func application(didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?, window: UIWindow) -> Bool {
        
                if let view = window.rootViewController as? ViewController {
                    let model = Person()
                    let viewModel = GreetingViewModel(person: model)
                    view.viewModel = viewModel
                }
        return true
    }
    
     
}
