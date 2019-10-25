//
//  WFTodayTableViewCell.swift
//  TheWeatherForecast
//
//  Created by le tong on 2019/10/25.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class WFTodayTableViewCell: UITableViewCell ,UICollectionViewDelegate, UICollectionViewDataSource{
    
    let identifier = "identifier"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCurrentUI()
    }
    
    func setCurrentUI() -> Void {
        let f = UICollectionViewFlowLayout.init()
        f.itemSize = CGSize.init(width: 60, height: 120)
        f.minimumLineSpacing = 0
        f.minimumInteritemSpacing = 0
        f.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let WFCollectionView = UICollectionView.init(frame: self.contentView.bounds, collectionViewLayout: f)
        WFCollectionView.backgroundColor = UIColor.white
        WFCollectionView.delegate = self
        WFCollectionView.dataSource = self
        WFCollectionView.register(WFTodayCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: identifier)
        self.contentView.addSubview(WFCollectionView)
        WFCollectionView.snp.makeConstraints { (m) in
            m.edges.equalTo(0)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let WFCell: WFTodayCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! WFTodayCollectionViewCell
        WFCell.updateCurrentUI(row: indexPath.row)
        return WFCell
    }
    
}
