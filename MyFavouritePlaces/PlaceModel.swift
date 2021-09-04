//
//  PlaceModel.swift
//  MyFavouritePlaces
//
//  Created by Юлия Караневская on 3.09.21.
//

import Foundation

struct Place {
    var name: String
    var location: String
    var type: String
    var image: String
    
    static let restaurants = ["Restaurant One", "Restaurant Two", "Restaurant Three", "Restaurant Four", "Restaurant Five", "Restaurant Six", "Restaurant Seven", "Restaurant Eight", "Restaurant Nine", "Restaurant Ten", "Restaurant Eleven", "Restaurant Twelve", "Restaurant Thirteen", "Restaurant Fourteen", "Restaurant Fifteen", "Restaurant Sixteen", "Restaurant Seventeen"]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in restaurants {
            places.append(Place(name: place, location: "one", type: "two", image: place))
        }
        return places
    }
}
