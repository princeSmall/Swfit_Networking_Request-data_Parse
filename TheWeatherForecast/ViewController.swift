//
//  ViewController.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/18.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

enum cellType:Int {
    case address = 0
    case today = 1
    case weekday = 2
    case weather = 3
    case wind = 4
    case shine = 5
    case totleCell = 6
}

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    let identifier = "identifier"
    let addressIdent = "addressIdent"
    let todayIdent = "todayIdent"
    let weekdayIdent = "weekdayIdent"
    let weatherIdent = "weatherIdent"
    let winIdent = "winIdent"
    let shineIdent = "shineIdent"
    
    
    
    
    var resModel: RESModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherResponse()
        view.addSubview(WFTabelView)
        
        let itemImage = UIImage.init(named: "list")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let rightButtonItem = UIBarButtonItem.init(image: itemImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(itemSelected))
        self.navigationItem.rightBarButtonItem = rightButtonItem
        // Do any additional setup after loading the view.
    }
//    使用第三方AlamofireObjectMapper
    func getWeatherResponse() -> Void {
        let url: String = "http://freecityid.market.alicloudapi.com/whapi/json/alicityweather/briefforecast3days"
        let dic = ["cityId" : "1098",
                   "token" : "677282c2f1b3d718152c4e25ed434bc4"
        ]
        let code  = "f3026e20bd8a474e9453a63873cb9e34"
        let header:HTTPHeaders = ["Authorization" : "APPCODE \(code) ",
            "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
        ]
        Alamofire.request(url, method: HTTPMethod.post, parameters: dic, encoding: URLEncoding.default, headers: header).responseObject {(response: DataResponse<RESModel>) in
            self.resModel = response.result.value
            self.WFTabelView.reloadData()
        }
    }
    @objc func itemSelected() -> Void{
        
    }

    
    lazy var WFTabelView = { () -> UITableView in
        let WF = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        WF.delegate = self;
        WF.dataSource = self;
        WF.register(WFBaseTableViewCell.classForCoder(), forCellReuseIdentifier: self.identifier)
        WF.register(WFAddressTableViewCell.classForCoder(), forCellReuseIdentifier: self.addressIdent)
        WF.register(WFTodayTableViewCell.classForCoder(), forCellReuseIdentifier: self.todayIdent)
        WF.register(WFWeekdayTableViewCell.classForCoder(), forCellReuseIdentifier: self.weekdayIdent)
        WF.register(WFWeatherTableViewCell.classForCoder(), forCellReuseIdentifier: self.weatherIdent)
        WF.register(WFWindTableViewCell.classForCoder(), forCellReuseIdentifier: self.winIdent)
        WF.register(WFShineTableViewCell.classForCoder(), forCellReuseIdentifier: self.shineIdent)
        WF.tableFooterView = UIView.init()
        return WF
    }()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight: CGFloat =  50.0;
        switch indexPath.section {
        case cellType.address.rawValue:
            rowHeight = 200
            break
        case cellType.today.rawValue:
            rowHeight = 120
            break
        default:
            rowHeight = 50
            break
        }
        return rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellType.totleCell.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let WFCell: WFBaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! WFBaseTableViewCell
        
        switch indexPath.section {
        case cellType.address.rawValue:
            let WFCell: WFAddressTableViewCell = tableView.dequeueReusableCell(withIdentifier: addressIdent) as! WFAddressTableViewCell
            
            WFCell.updateCurrentUI(address: self.resModel?.data?.city?.name ?? "")
            return WFCell
        case cellType.today.rawValue:
            let WFCell: WFTodayTableViewCell = tableView.dequeueReusableCell(withIdentifier: todayIdent) as! WFTodayTableViewCell
            return WFCell
        case cellType.weekday.rawValue:
            let WFCell: WFWeekdayTableViewCell = tableView.dequeueReusableCell(withIdentifier: weekdayIdent) as! WFWeekdayTableViewCell
            return WFCell
        case cellType.weather.rawValue:
            let WFCell: WFWeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: weatherIdent) as! WFWeatherTableViewCell
            return WFCell
        case cellType.wind.rawValue:
            let WFCell: WFWindTableViewCell = tableView.dequeueReusableCell(withIdentifier: winIdent) as! WFWindTableViewCell
            return WFCell
        case cellType.shine.rawValue:
            let WFCell: WFShineTableViewCell = tableView.dequeueReusableCell(withIdentifier: shineIdent) as! WFShineTableViewCell
            return WFCell
        default:
            break
        }
        return UITableViewCell.init()
//        return WFCell;
    }
    
    /****
     //    使用系统方法
     func getWeatherResponse() -> Void {
     let url: String = "http://freecityid.market.alicloudapi.com/whapi/json/alicityweather/briefforecast3days"
     let code  = "f3026e20bd8a474e9453a63873cb9e34"
     let bodys: String = "cityId=2&token=677282c2f1b3d718152c4e25ed434bc4"
     
     let header:HTTPHeaders = ["Authorization" : "APPCODE \(code) ",
     "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
     ]
     let request = NSMutableURLRequest.init(url: NSURL.init(string: url)! as URL)
     request.httpMethod = "POST"
     request.addValue("APPCODE \(code)", forHTTPHeaderField: "Authorization")
     request.addValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField:  "Content-Type")
     
     let data = bodys.data(using: String.Encoding.utf8)
     request.httpBody = data
     
     let session = URLSession.init(configuration: URLSessionConfiguration.default)
     let tast = session.dataTask(with: request as URLRequest) { (datas, responses, error) in
     let dict: NSDictionary = try! JSONSerialization.jsonObject(with: datas ?? Data.init(), options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
     print(dict)
     
     let pDataDict: NSDictionary = dict.object(forKey: "data") as! NSDictionary
     let pForecastArray: NSArray = pDataDict.object(forKey: "forecast") as! NSArray
     let pCityDict: NSDictionary = pDataDict.object(forKey: "city") as! NSDictionary
     let pCity: City = City.init()
     
     pCity.cityId = pCityDict.object(forKey: "cityId") as! Int
     pCity.pname = pCityDict.object(forKey: "pname") as! String
     pCity.counname = pCityDict.object(forKey: "counname") as! String
     pCity.name = pCityDict.object(forKey: "name") as! String
     pCity.secondaryname = pCityDict.object(forKey: "secondaryname") as! String
     
     var forecastArray: [ForeCast] = NSMutableArray.init() as! [ForeCast]
     
     for m in pForecastArray {
     let pForecastDict = m as!NSDictionary
     let pForecast: ForeCast = ForeCast.init()
     pForecast.conditionDay = pForecastDict.object(forKey: "conditionDay") as! String
     pForecast.conditionIdDay = pForecastDict.object(forKey: "conditionIdDay") as! String
     pForecast.conditionIdNight = pForecastDict.object(forKey: "conditionIdNight") as! String
     pForecast.conditionNight = pForecastDict.object(forKey: "conditionNight") as! String
     pForecast.predictDate = pForecastDict.object(forKey: "predictDate") as! String
     pForecast.tempDay = pForecastDict.object(forKey: "tempDay") as! String
     pForecast.tempNight = pForecastDict.object(forKey: "tempNight") as! String
     pForecast.updatetime = pForecastDict.object(forKey: "updatetime") as! String
     pForecast.windDirDay = pForecastDict.object(forKey: "windDirDay") as! String
     pForecast.windDirNight = pForecastDict.object(forKey: "windDirNight") as! String
     pForecast.windLevelDay = pForecastDict.object(forKey: "windLevelDay") as! String
     pForecast.windLevelNight = pForecastDict.object(forKey: "windLevelNight") as! String
     forecastArray.append(pForecast)
     }
     let pData = Datas.init(city: pCity, forecast: forecastArray)
     let pForecastModel = ForecastModel.init(data: pData)
     print(pForecastModel)
     }
     tast.resume()
     
     }
     **/
    
    
}

