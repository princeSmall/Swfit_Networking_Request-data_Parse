//
//  WFTopView.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/23.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit
import SnapKit

class WFTopView: UIView {

    let addressLabel = UILabel()
    let addressImageView = UIImageView()
    let timeLabel = UILabel()
    let leftLabel = UILabel()
    let rightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCurrentUI()
    }
    func updateCurrentUI(address: String) -> Void {
        addressLabel.text = address
        addressImageView.image = UIImage.init(named: "position")
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm:ss"// 自定义时间格式
        timeLabel.text = "上次更新时间：\(dateformatter.string(from: Date()))"
        leftLabel.text = "中国天气"
        rightLabel.text = "15分钟前发布"
    }
    
    func setCurrentUI() -> Void {
        self.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.addSubview(addressImageView)
        addressImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.addressLabel.snp_centerY)
            make.left.equalTo(self.addressLabel.snp_right).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        self.addSubview(self.timeLabel)
        timeLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.addressLabel.snp_centerX)
            make.top.equalTo(self.addressLabel.snp_bottom)
            make.height.equalTo(15)
            make.width.equalTo(300)
        }
        self.addSubview(leftLabel)
        leftLabel.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.bottom.equalTo(-10)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }
        self.addSubview(rightLabel)
        rightLabel.snp_makeConstraints { (make) in
            make.right.equalTo(-20)
            make.bottom.equalTo(-10)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
