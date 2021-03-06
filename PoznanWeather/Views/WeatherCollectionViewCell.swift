//
//  WeatherCollectionViewCell.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 05/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.white.withAlphaComponent(0.25) : UIColor.clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
