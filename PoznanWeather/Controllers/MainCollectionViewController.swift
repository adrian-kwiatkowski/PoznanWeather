//
//  MainCollectionViewController.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    let weatherCellIdentifier = "WeatherCollectionViewCell"
    
    var daysArray = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: weatherCellIdentifier, bundle: nil), forCellWithReuseIdentifier: weatherCellIdentifier)
        
        spinnerView.startAnimating()
        APIService.fetchWeatherData { (response) in
            self.daysArray = response
            self.collectionView.reloadData()
            self.spinnerView.stopAnimating()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "WeatherDetailsViewController") as? WeatherDetailsViewController {
            detailsVC.modalPresentationStyle = .overCurrentContext
            detailsVC.weatherData = daysArray[indexPath.row]
            present(detailsVC, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath)
        header.backgroundColor = UIColor(white: 1, alpha: 0.25)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: weatherCellIdentifier, for: indexPath) as! WeatherCollectionViewCell
        
        let weatherData = daysArray[indexPath.row]
        cell.dateLabel.text = weatherData.compDate
        cell.tempLabel.text = "\(weatherData.temp.avgCelcius)°C"
        cell.pressureLabel.text = "\(weatherData.compPressure) hPa"
        cell.iconLabel.image = weatherData.weatherIcon
        
        return cell
    }
}
