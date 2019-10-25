//
//  RESModel.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/21.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit
import ObjectMapper

class RESModel: Mappable {
    var data: pData?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
    
    
}

class pData: Mappable {
    var forecast: [pForecast]?
    var city: pCity?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        forecast <- map["forecast"]
        city <- map["city"]
    }
    
    
}


class pForecast: Mappable {
    
    var conditionDay: String?
    var conditionIdDay: String?
    var conditionIdNight: String?
    var conditionNight: String?
    var humidity: String?
    var predictDate: String?
    var tempDay: String?
    var tempNight: String?
    var updatetime: String?
    var windDegreesDay: String?
    var windDegreesNight: String?
    var windDirDay: String?
    var windDirNight: String?
    var windLevelDay: String?
    var windLevelNight: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        conditionDay <- map["conditionDay"]
        conditionIdDay <- map["conditionIdDay"]
        conditionIdNight <- map["conditionIdNight"]
        conditionNight <- map["conditionNight"]
        humidity <- map["humidity"]
        predictDate <- map["predictDate"]
        tempDay <- map["tempDay"]
        tempNight <- map["tempNight"]
        updatetime <- map["updatetime"]
        windDegreesDay <- map["windDegreesDay"]
        windDegreesNight <- map["windDegreesNight"]
        windDirDay <- map["windDirDay"]
        windDirNight <- map["windDirNight"]
        windLevelDay <- map["windLevelDay"]
        windLevelNight <- map["windLevelNight"]
    }
    
    
}
class pCity: Mappable {
    
    var cityId: Int?
    var ianatimezone: String?
    var name: String?
    var pname: String?
    var counname: String?
    var secondaryname: String?
    var timezone: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cityId <- map["cityId"]
        ianatimezone <- map["ianatimezone"]
        name <- map["name"]
        pname <- map["pname"]
        counname <- map["counname"]
        secondaryname <- map["secondaryname"]
        timezone <- map["timezone"]
    }
    

    
}


