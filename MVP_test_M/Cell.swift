//
//  Cell.swift
//  MVVM
//
//  Created by alex zolin on 18/04/16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    weak var viewModel: ViewModel! {
        didSet {
            self.timeLabel.text = viewModel.timeString
            self.cityLabel.text = viewModel.cityTitle
            self.temperatureLabel.text = viewModel.temperatureString
        }
    }
}
