//
//  ViewController.swift
//  ProtocolsDelegate
//
//  Created by User on 04.03.25.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var countries:[CoutryCollectionViewCell.Item] = [
        .init(image: .az, country: "Azerbaijan", capital: nil),
        .init(image: .tr, country: "Turkey", capital: nil),
        .init(image: .ru, country: "Russia", capital: nil),
        .init(image: .en, country: "English", capital: nil)
        
    
    
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loyaut = UICollectionViewFlowLayout()
        loyaut.scrollDirection = .vertical
        loyaut.itemSize = CGSize(width: collectionView.frame.width / 2 - 10, height: 120)
        collectionView.collectionViewLayout = loyaut
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoutryCollectionViewCell", for: indexPath) as? CoutryCollectionViewCell else {
            return UICollectionViewCell()
            }
        cell.configure(item: countries[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if let vc = storyboard?.instantiateViewController(identifier: "CountryCapitalInputVC") as? CountryCapitalInputVC
         {
           vc.cntryName = countries[indexPath.row].country
           vc.delegate = self
           vc.countryIndex = indexPath.row
           self.present(vc, animated: true)
        }
    }
}

extension ViewController:CountryCapitalInputDelegate {
    func saveCapital(name: String, index: Int) {
        self.countries[index].capital = name
        self.collectionView.reloadData()
    }
}
