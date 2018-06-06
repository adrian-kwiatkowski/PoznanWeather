//
//  MainCollectionViewController.swift
//  PoznanWeather
//
//  Created by Adrian Kwiatkowski on 04/06/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
//    var largeCellIndexPath: IndexPath? {//NSIndexPath? {
//        didSet {
//            var indexPaths = [IndexPath]()
//            if let largeCellIndexPath = largeCellIndexPath {
//                indexPaths.append(largeCellIndexPath)
//            }
//            if let oldValue = oldValue {
//                indexPaths.append(oldValue)
//            }
//            collectionView?.performBatchUpdates({
//                self.collectionView?.reloadItems(at: indexPaths)
//            }) { completed in
//                if let largeCellIndexPath = self.largeCellIndexPath {
//                    self.collectionView?.scrollToItem(
//                        at: largeCellIndexPath,
//                        at: .centeredVertically,
//                        animated: true)
//                }
//            }
//        }
//    }
    
    let itemsPerRow: CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var weatherManager: WeatherManager?
    var lastSelectedCell: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager = WeatherManager()
        weatherManager!.getWeatherData() {
            self.collectionView?.reloadData()
            print("data fetched successfully")
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
            cell.dateLabel.text = cellToDisplay.date
            cell.tempLabel.text = "\(Int(cellToDisplay.avgTemperature))°C"
            cell.pressureLabel.text = "\(Int(cellToDisplay.pressure)) hPa"
        }
        
        let iconID = weatherManager?.dayAtIndex(index: indexPath.row).weatherIcon
        let url = URL(string: "https://openweathermap.org/img/w/\(iconID ?? "01n").png")
        let data = try? Data(contentsOf: url!)
        cell.iconLabel.image = UIImage(data: data!)
        
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        largeCellIndexPath = largeCellIndexPath == indexPath ? nil : indexPath
//        return false
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
//        
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
    
}
