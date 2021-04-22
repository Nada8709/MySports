//
//  HomeCollectionViewController.swift
//  Sports
//
//  Created by Mina Kamal on 21.04.21.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "sportsCell"

class HomeCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    
   
    

    
    let homePresenter : HomePresenterProtocol = HomePresenter(remoteDataSource: Remote())
    var allSportsObjects = [Sport]()
    let imageList = ["https://www.thesportsdb.com//images//sports//soccer.jpg"
                     ,"https://www.thesportsdb.com//images//sports//soccer.jpg"
                     ,"https://www.thesportsdb.com//images//sports//soccer.jpg"
                     ,"https://www.thesportsdb.com//images//sports//soccer.jpg"
                     ,"https://www.thesportsdb.com//images//sports//soccer.jpg"
                     ,"https://www.thesportsdb.com//images//sports//soccer.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter.setDelegate(homeVC: self)
        
        homePresenter.getAllSports { (allSports) in
            if allSports.count > 0 {
            self.allSportsObjects = allSports
            self.collectionView.reloadData()
            }
            else {
                print("Error HomeViewCollection")
            }
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
       
        //allSportsObjects[]
        //segue.destination.
    }
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        homePresenter.onSelectedItem(selectedSport: allSportsObjects[indexPath.row])
        return true
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allSportsObjects.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        addShadowAndRaduisForCell(cell: cell)
        
        cell.sportsImageView.sd_setImage(with: URL(string: allSportsObjects[indexPath.row].strSportThumb), placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.sportsNameLabel.text = allSportsObjects[indexPath.row].strSport
       
        
        return cell
    }
    
    func addShadowAndRaduisForCell(cell : HomeCollectionViewCell){
            cell.contentView.layer.cornerRadius = 10.0
           cell.contentView.layer.borderWidth = 1.0
           cell.contentView.layer.borderColor = UIColor.clear.cgColor
           cell.contentView.layer.masksToBounds = true;

           cell.layer.shadowColor = UIColor.lightGray.cgColor
           cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
           cell.layer.shadowRadius = 2.0
           cell.layer.shadowOpacity = 1.0
           cell.layer.masksToBounds = false;
           cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
    
    // for add padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        }
    
    // display two items for all rows 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2)-10, height: 150)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}

extension HomeCollectionViewController : HomeDelegateProtocol {
    func navigateToLeaguges(selectedSport: String) {
        let leagueVC = LeaguesTableViewController()
        leagueVC.selectedSport = selectedSport
       // present(leagueVC, animated: true, completion: nil)
    }
}
