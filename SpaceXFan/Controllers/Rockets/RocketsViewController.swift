//
//  RocketsViewController.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 22.05.2022.
//

import UIKit
import FirebaseAuth

class RocketsViewController: UIViewController,BackgroundImageProtocol {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionViewRocket: UICollectionView!
    
    
    //MARK: - Vars
    var rocketList = [Rocket]()
    var defaultImageList = [UIImage]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        createBackground(UIImage(named: "spaceXIOsBg")!, UIImageView(frame: self.view.frame))
        showAllRockets()
        registerCells()
        defaultImageList = [UIImage(named: "6486482399SpacexFalconHeavyPngTransparentPng")!,UIImage(named: "spaceXDragon")!,UIImage(named: "spaceXStarship")!,UIImage(named: "6486482399SpacexFalconHeavyPngTransparentPng")!]
        
    }
    

    @IBAction func logOutClicked(_ sender: Any) {
        logOut()
    }
    
    
    //MARK: - For collectionviewcell set
   private func registerCells() {
       collectionViewRocket.register(UINib(nibName: RocketCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRocketDetail" {
            let rocket = sender as? Rocket
            let VC = segue.destination as! DetailRocketViewController
            VC.rocket = rocket
        }
    }

    
    private func showAllRockets() {
        Servicee.showAllRockets() { response in
            self.rocketList = response
            print("\(self.rocketList[3].name)")
            print("\(self.rocketList[3].mass.kg) \(self.rocketList[2].mass.lb)")
            print(self.rocketList[1].flickrImages.count)
            DispatchQueue.main.async {
                self.collectionViewRocket.reloadData()
            }
        }
    }


    //MARK: - For logout request func
    private func logOut() {
        do{
            try Auth.auth().signOut()
            //UserDefaults.standard.removeObject(forKey: kCURRENTUSER)
            let controller = storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
            present(controller, animated: true, completion: nil)
        } catch{
            print(error.localizedDescription)
        }
    }

}


extension RocketsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as! RocketCollectionViewCell
        cell.rocketImage.image = defaultImageList[indexPath.row]
        cell.setup(rocketList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rocket = rocketList[indexPath.row]
        performSegue(withIdentifier: "toRocketDetail", sender: rocket)
    }
    
    
    
    
}
