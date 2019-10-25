//
//  ForecastModel.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/21.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit


class ForecastModel: NSObject {
    var data = Datas(city: City.init(), forecast: [ForeCast.init()])
    init(data: Datas) {
        self.data = data
    }
}

class Datas: NSObject {
    var city = City()
    var forecast:[ForeCast] = []
    init(city: City, forecast:[ForeCast]) {
        self.city = city
        self.forecast = forecast
    }
}

class City: NSObject {
    var cityId: Int = 0
    var counname: String = ""
    var name: String = ""
    var pname: String = ""
    var secondaryname: String = ""
}
class ForeCast: NSObject {
    var conditionDay: String = ""
    var conditionIdDay: String = ""
    var conditionIdNight: String = ""
    var conditionNight: String = ""
    var predictDate: String = ""
    var tempDay: String = ""
    var tempNight: String = ""
    var updatetime: String = ""
    var windDirDay: String = ""
    var windDirNight: String = ""
    var windLevelDay: String = ""
    var windLevelNight: String = ""
}
