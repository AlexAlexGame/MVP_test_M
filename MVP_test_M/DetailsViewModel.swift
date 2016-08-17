//
//  DetailsViewModel.swift
//  MVVM
//
//  Created by alex zolin on 19/04/16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

import Foundation

class DetailsViewModel {
    var cityTitle: String!
    var windString: String!
    var precipitationString: String!
    var temperatureString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.firstName
        self.temperatureString = weather.lastName
     }
}
