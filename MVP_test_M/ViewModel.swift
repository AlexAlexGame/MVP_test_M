//
//  ViewModel.swift
//  MVVM
//
//  Created by alex zolin on 18/04/16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

// NO UIKit, no concern about view!

import Foundation

class ViewModel {
    var cityTitle: String!
    var temperatureString: String!
    var timeString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.firstName
        self.timeString = weather.lastName
    }
}
