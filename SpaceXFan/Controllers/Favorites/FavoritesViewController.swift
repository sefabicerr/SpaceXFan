//
//  FavoritesViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Vars
    var rocketList = [Favorite]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavoriteRockets()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFavoriteDetail" {
            let VC = segue.destination as! DetailFavoriteViewController
            VC.favorite = sender as? Favorite
        }
    }
    
    //MARK: - For collectionviewcell set
    private func registerCells() {
        collectionView.register(UINib(nibName: RocketCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
     }
    
    //MARK: - Download favorite items from firebase
    private func getFavoriteRockets() {
        downloadItemsFromFirebase(with: User.currentId()) { allRockets in
            self.rocketList = allRockets
            self.collectionView.reloadData()
        }
    }
}

extension FavoritesViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as! RocketCollectionViewCell
        let rocket = rocketList[indexPath.row]
        cell.setupFavorite(rocket)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = rocketList[indexPath.row]
        performSegue(withIdentifier: "toFavoriteDetail", sender: favorite)
    }
    
}
