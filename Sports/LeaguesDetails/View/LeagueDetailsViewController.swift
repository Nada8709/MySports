//
//  LeagueDetailsViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UICollectionViewDelegate{
    private let getimages=GetBadges()
    var latestresults:[LatestResultsViewObject]=[]
    var teams:[TeamsViewObject]=[]
    var upcomingEvents : [UpcomingEventsViewObject] = []
    
    let identiferLatestCell = "latestCell"
    let identiferUpcomingCell = "upcomingCell"
    let identiferTeamCell = "teamCell"
    var leaguesPresenter : LeaguesDetailsPresenterProtocol = LeaguesDetailsPresenter(Remote())
   
    @IBOutlet weak var favouriteImage: UIButton!
    @IBAction func favouriteBtn(_ sender: UIButton){
        favouriteImage.setImage(UIImage(systemName: "suit.heart.fill" ), for: .normal)
    }
    @IBOutlet weak var latestResultCollectionView: UICollectionView!
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var teamscollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingEventsCollectionView.delegate=self
        upcomingEventsCollectionView.dataSource=self
        latestResultCollectionView.delegate = self
        latestResultCollectionView.dataSource = self
        teamscollectionview.delegate = self
        teamscollectionview.dataSource = self
        
        
        leaguesPresenter.getTeams(strLeague: "English Premier League") { [weak self] (allTeams) in
            self?.teams=allTeams
            self?.teamscollectionview.reloadData()
            self?.leaguesPresenter.getresults(idLeague: "4328") { [weak self] (events) in
                self?.latestresults=(self?.getimages.getBadges(allteams: self!.teams, allevents: events))!
                self?.latestResultCollectionView.reloadData()
            }
            self?.leaguesPresenter.getUpcomingEvents(completionHandler: {[unowned self] upcomingevents in
                
                self?.upcomingEvents=(self?.getimages.getBadges(allteams: self!.teams, allevents: upcomingevents))!
                    self?.upcomingEventsCollectionView.reloadData()
            })
            
            
        }
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
extension LeagueDetailsViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingEventsCollectionView{
            return upcomingEvents.count
        }
        else if collectionView == latestResultCollectionView {
            return latestresults.count
        }
        return teams.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == upcomingEventsCollectionView){
            let cell=upcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: identiferUpcomingCell, for: indexPath) as! UpcomingEventsCollectionViewCell
           cell.upcomingEvent = upcomingEvents[indexPath.row]
            return cell
        }
        else if collectionView == latestResultCollectionView{
            let cell=latestResultCollectionView.dequeueReusableCell(withReuseIdentifier: identiferLatestCell, for: indexPath) as! LatestResultsCollectionViewCell
            cell.latestresult=latestresults[indexPath.row]
            return cell
        }
        else {
            let cell=teamscollectionview.dequeueReusableCell(withReuseIdentifier: identiferTeamCell, for: indexPath) as! TeamsCollectionViewCell
           // cell.teamName.text=teams[indexPath.row].strTeam
            
           cell.team=teams[indexPath.row]
            return cell
        }
    }
}


