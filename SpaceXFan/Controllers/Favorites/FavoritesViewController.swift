//
//  FavoritesViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 23.05.2022.
//

import UIKit
import SwiftUI

class FavoritesViewController: UIViewController,AlertProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Vars
    var rocketList = [Favorite]()
    let emptyBackground = EmptyBackgroundView(frame: CGRect(x: 0, y: 88, width: 414, height: 700))

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if User.currentUser() == nil {
            alertMessage(titleInput: "Default giriş", messageInput: "Favorileri görüntülemek için kullanıcı girişi gerekli.") { action in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let logInVC = storyboard.instantiateViewController(identifier: "LogInVC")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(logInVC)
            }
        } else {
            getFavoriteRockets()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFavoriteDetail" {
            let VC = segue.destination as! DetailFavoriteViewController
            VC.favorite = sender as? Favorite
        }
    }
    
    //MARK: - For collectionviewcell set
    private func registerCells() {
        collectionView.register(UINib(nibName: FavoriteCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
     }
    
    //MARK: - Download favorite items from firebase
    private func getFavoriteRockets() {
        downloadItemsFromFirebase(with: User.currentId()) { allRockets in
            self.rocketList = allRockets
            self.collectionView.reloadData()
            
            if !self.rocketList.isEmpty {
                self.emptyBackground.removeFromSuperview()
            } else {
                self.view.addSubview(self.emptyBackground)
            }
        }
    }
}

extension FavoritesViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as! FavoriteCollectionViewCell
        let rocket = rocketList[indexPath.row]
        cell.setupFavorite(rocket)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = rocketList[indexPath.row]
        performSegue(withIdentifier: "toFavoriteDetail", sender: favorite)
    }
    
}
