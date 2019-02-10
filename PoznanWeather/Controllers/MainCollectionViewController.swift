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
    var daysArray = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.fetchWeatherData { (response) in
            self.daysArray = response
            self.collectionView.reloadData()
            self.spinnerView.stopAnimating()
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCellID", for: indexPath) as! WeatherCell
        
        let cellToDisplay = daysArray[indexPath.row]
            cell.dateLabel.text = cellToDisplay.compDate
            cell.tempLabel.text = "\(cellToDisplay.averageTemp)°C"
            cell.pressureLabel.text = "\(cellToDisplay.compPressure) hPa"
        
        
        let iconID = cellToDisplay.weatherIcon
        let url = URL(string: "https://openweathermap.org/img/w/\(iconID).png")
        let data = try? Data(contentsOf: url!)
        cell.iconLabel.image = UIImage(data: data!)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath)
        header.backgroundColor = UIColor(white: 1, alpha: 0.25)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! WeatherCell
        let dayDetails = daysArray[indexPath.row]
        selectedCell.backgroundColor = UIColor(white: 1, alpha: 0.25)
        
        let alertString = "Temperature: \(dayDetails.minimumTemp)°C - \(dayDetails.maximumTemp)°C\nPressure: \(dayDetails.compPressure) hPa\nHumidity: \(dayDetails.humidity)%\nWind Speed: \(dayDetails.windSpeed) m/s\nWind Direction: \(dayDetails.windDirectionIcon)"
        
        let alert = UIAlertController(title: selectedCell.dateLabel.text, message: alertString, preferredStyle: .alert)
        let imageView = UIImageView(image: selectedCell.iconLabel.image)
        let action = UIAlertAction(title: "Back", style: .default) { _ in
            selectedCell.backgroundColor = UIColor(white: 1, alpha: 0)
        }
        alert.addAction(action)
        alert.view.addSubview(imageView)
        self.present(alert, animated: true)
    }
    
}


