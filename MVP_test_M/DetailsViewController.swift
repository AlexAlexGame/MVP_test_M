//
//  DetailsViewController.swift
//  MVVM
//
//  Created by alex zolin on 19/04/16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    weak var viewModel: DetailsViewModel!
    
    @IBOutlet weak var showGreetingButton : UIButton!

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if viewModel != nil {
        self.weatherLabel.text = viewModel.temperatureString
//        self.windLabel.text = viewModel.windString
//        self.cityLabel.text = viewModel.cityTitle
//        self.precipitationLabel.text = viewModel.precipitationString
        }
        self.showGreetingButton.addTarget(self, action: #selector(DetailsViewController.didTapButton(_:)), forControlEvents: .TouchUpInside)

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - actions
    func didTapButton(button: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
