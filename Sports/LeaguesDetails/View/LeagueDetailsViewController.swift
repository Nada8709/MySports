//
//  LeagueDetailsViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    
    var latestresults:[LatestResultsViewObject]=[]
    var teams:[TeamsViewObject]=[]
   
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var teamscollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        upcomingEventsCollectionView.delegate=self
      upcomingEventsCollectionView.dataSource=self
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LeagueDetailsViewController: UICollectionViewDelegate{
    
}
extension LeagueDetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView==upcomingEventsCollectionView){
            return 4
        }
        else {
            return teams.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == upcomingEventsCollectionView){
            let cell=upcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: "latestresult", for: indexPath) as! UpcomingEventsCollectionViewCell
          //  cell.latestresult=latestresults[indexPath.row]
            return cell
        }
        else{
            let cell=teamscollectionview.dequeueReusableCell(withReuseIdentifier: "teams", for: indexPath) as! TeamsCollectionViewCell
            return cell
        }
    }
    
    
}
extension LeagueDetailsViewController: UICollectionViewDelegateFlowLayout{
    
}
