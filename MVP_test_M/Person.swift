//
//  Person.swift
//  MVVM_test_M
//
//  Created by alex zolin on 15.08.16.
//  Copyright © 2016 alex zolin. All rights reserved.
//


import Foundation

import Kanna

class Person { // Model
    var imageURL: NSURL?
    var image: NSString?
    var weatherArray: [Weather]!
    
    
    func getWeather(completion:[Weather] -> Void){
        imageURL = NSURL(string: "http://4pda.ru/news")
        let coding :UInt
        coding = NSWindowsCP1251StringEncoding
        var array = [Weather]()
        if let url = imageURL {
             dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)) {
                
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    if imageData != nil {
                        let dataString = imageData!
                        self.image = NSString(data: dataString, encoding: coding)
                        if let doc = Kanna.HTML(html: self.image  as! String , encoding: coding) {
                            
                            // Search for nodes by CSS
                            for link in doc.css("a, link") {
//                                if ((link.text?.compare(""))?.rawValue > 0) {
//                                    array.append(self.mockWeatherObjectData( link.text!))
//                                }

                            }
                            
                            // Search for nodes by XPath
                            for link in doc.xpath("//a | //link") {
                                print(link.text!)
                                print(link["href"]!)
                                if ((link.text?.compare(""))?.rawValue > 0) {
                                        array.append(self.mockWeatherObject( link.text!))
                                 }
                            }
                        }
                        completion(self.mockResponseUrlData(&array))
                    } else {
                        self.image = nil
                    }
                    
                }
                
            }
            
        }
    }

       // MARK: - private
    private func mockResponseUrlData(inout array:[Weather]) -> [Weather] {
        return array
    }

 
    private func mockResponse() -> [Weather] {
        var array = [Weather]()
        array.append(mockWeatherObject( "Moscow"))
        array.append(mockWeatherObject( "London"))
        return array
    }
    
    private func mockWeatherObjectData( name: String) -> Weather {
        var weather = Weather()
        weather.lastName = name
        
        
        
        return weather
    }

    private func mockWeatherObject( name: String) -> Weather {
        var weather = Weather()
        weather.firstName = name
        weather.lastName = name
    
        
        
         return weather
    }
    func perFormConnectionToGrabUrlContent( url:String)-> NSString {
        let url = NSURL(string: url)
        let request = NSURLRequest(URL: url!)
        
        var htmlContentTemp:NSString = ""
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            htmlContentTemp = NSString(data: data!, encoding: NSWindowsCP1250StringEncoding)!
        }
        return htmlContentTemp
        
       
    }

}
