//
//  WeatherDetailsViewController.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski 2 on 10/02/2019.
//  Copyright © 2019 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.cornerRadius = 20.0
            cardView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    var weatherData: WeatherData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconImageView.image = weatherData.weatherIcon
        dateLabel.text = weatherData.compDate
        tempLabel.text = "\(weatherData.temp.minCelcius) - \(weatherData.temp.maxCelcius) °C"
        pressureLabel.text = "\(weatherData.compPressure) hPa"
        humidityLabel.text = "\(weatherData.humidity)%"
        windLabel.text = "\(weatherData.windSpeed) m/s " + weatherData.windDirectionIcon
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let presentingVC = presentingViewController {
            let presentingVCFrame = presentingVC.view.frame
            let dimView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            dimView.frame = presentingVCFrame
            dimView.alpha = 0.0
            presentingVC.view.addSubview(dimView)
            
            UIView.animate(withDuration: 0.25) {
                dimView.alpha = 1.0
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let presentingVC = presentingViewController, let dimView = presentingVC.view.subviews.last {
            
            UIView.animate(withDuration: 0.25, animations: {
                dimView.alpha = 0.0
            }) { (finished) in
                dimView.removeFromSuperview()
            }
        }
    }
    
    @IBAction func userDidTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
