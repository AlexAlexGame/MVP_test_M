//
//  GreetingViewModel.swift
//  MVVM_test_M
//
//  Created by alex zolin on 15.08.16.
//  Copyright © 2016 alex zolin. All rights reserved.
//
class GreetingViewModel: GreetingViewModelProtocol {

 
    let person: Person
    private var weatherArray: [Weather]!
    private var cellsArray = [ViewModel]()
    var detailsViewModel: DetailsViewModel!
    
    required init(person: Person) {
        self.person = person
    }
    func showGreeting() ->  [Weather]{
        
        return self.weatherArray
    }
    func showGreetingArray() ->  [ViewModel]{
        
        return self.cellsArray
    }

    
    func updateData(completion:() -> Void) {
        cellsArray.removeAll()
        person.getWeather { (weatherArray) -> Void in
            self.weatherArray = weatherArray
            for weatherObject in weatherArray {
                self.cellsArray.append(ViewModel(weather: weatherObject))
            }
            completion()
        }
    }

    func numberOfCities() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(index: Int) -> ViewModel? {
        guard index < cellsArray.count else { return nil }
        return cellsArray[index]
    }

    func detailsViewModel(index: Int) -> DetailsViewModel {
        self.detailsViewModel = DetailsViewModel(weather: weatherArray[index])
        return self.detailsViewModel
    }

}