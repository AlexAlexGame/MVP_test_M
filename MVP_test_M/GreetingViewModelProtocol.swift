//
//  GreetingViewModelProtocol.swift
//  MVVM_test_M
//
//  Created by alex zolin on 15.08.16.
//  Copyright © 2016 alex zolin. All rights reserved.
//

protocol GreetingViewModelProtocol: class {
    init(person: Person)
    func showGreeting()->[Weather]
    func updateData(completion:() -> Void)
    func numberOfCities() -> Int
    func showGreetingArray() ->  [ViewModel]
    func cellViewModel(index: Int) -> ViewModel?
    func detailsViewModel(index: Int) -> DetailsViewModel
}