//
//  MainCollectionViewController.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    var weatherManager: WeatherManager?
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager = WeatherManager()
        weatherManager!.getWeatherData() {
            
            self.collectionView.performBatchUpdates({
                let indexSet = IndexSet(integersIn: 0...0)
                self.collectionView.reloadSections(indexSet)
            }, completion: nil)
            
            print("data fetched successfully")
            self.spinnerView.stopAnimating()
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherManager!.daysArrayCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCellID", for: indexPath) as! WeatherCell
        
        if let cellToDisplay = weatherManager?.dayAtIndex(index: indexPath.row) {
            cell.dateLabel.text = cellToDisplay.dateString
            cell.tempLabel.text = "\(Int(cellToDisplay.temp.avg))°C"
            cell.pressureLabel.text = "\(Int(cellToDisplay.pressure)) hPa"
        }
        
        let iconID = weatherManager?.dayAtIndex(index: indexPath.row).weather.first?.icon
        let url = URL(string: "https://openweathermap.org/img/w/\(iconID ?? "01n").png")
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
        let dayDetails = weatherManager!.dayAtIndex(index: indexPath.row)
        selectedCell.backgroundColor = UIColor(white: 1, alpha: 0.25)
        
        let alertString = "Temperature: \(Int(dayDetails.temp.min))°C - \(Int(dayDetails.temp.max))°C\nPressure: \(Int(dayDetails.pressure)) hPa\nHumidity: \(dayDetails.humidity)%\nWind Speed: \(dayDetails.windSpeed) m/s\nWind Direction: \(weatherManager!.getWindDirectionString(index: indexPath.row))"
        
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


