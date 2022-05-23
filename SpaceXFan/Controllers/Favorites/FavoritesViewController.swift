//
//  FavoritesViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension FavoritesViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as! RocketCollectionViewCell
        
      
        return UICollectionViewCell()
    }
    
}
