//
//  WFTodayCollectionViewCell.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/25.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class WFTodayCollectionViewCell: UICollectionViewCell {
    
    
    var timeLabel = UILabel()
    var weathLabel = UILabel()
    var weatherIcon = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCurrentUI()
    }
    
    func updateCurrentUI(row: NSInteger) -> Void {
        var dateString: NSString = ""
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH"// 自定义时间格式
        dateString = dateformatter.string(from: Date()) as NSString
        
        if (dateString.integerValue + row) > 24 {
            dateString =  "\(dateString.integerValue + row - 24)" as NSString
        }else{
            dateString = "\(dateString.integerValue + row)" as NSString
        }
        timeLabel.text = dateString as String
        let weatherNumber = arc4random() % 20 + 5
        var icon: String = ""
        
        switch row % 6 {
        case 0:
            icon = "weather1"
            break;
        case 1:
            icon = "weather2"
            break;
        case 2:
            icon = "weather3"
            break;
        case 3:
            icon = "weather4"
            break;
        case 4:
            icon = "weather5"
            break;
        case 5:
            icon = "weather6"
            break;
        default:
            break;
        }
        self.weatherIcon.image = UIImage.init(named: icon)
        self.weathLabel.text = "\(weatherNumber)"
    }
    func setCurrentUI() -> Void {
        timeLabel = UILabel.init()
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (m) in
            m.left.equalTo(20)
            m.top.equalTo(10)
            m.right.equalTo(-20)
            m.height.equalTo(20)
        }
        
        weathLabel = UILabel.init()
        self.contentView.addSubview(weathLabel)
        weathLabel.snp.makeConstraints { (m) in
            m.left.equalTo(20)
            m.right.equalTo(-20)
            m.bottom.equalTo(-10)
            m.height.equalTo(20)
        }
        timeLabel.font = UIFont.systemFont(ofSize: 12.0)
        weathLabel.font = UIFont.systemFont(ofSize: 13.0)
        
        timeLabel.textAlignment = NSTextAlignment.center
        weathLabel.textAlignment = NSTextAlignment.center
        weatherIcon = UIImageView.init()
        self.contentView.addSubview(weatherIcon)
        weatherIcon.snp.makeConstraints { (m) in
            m.centerX.equalTo(self)
            m.bottom.equalTo(weathLabel.snp_top).offset(-20)
            m.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
