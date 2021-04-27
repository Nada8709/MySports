//
//  LeagueDetailsViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    private let leagueDetailsPresenter = LeagueDetailsPresenter()
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
        
        leaguesPresenter.getUpcomingEvents(completionHandler: { events in
            if events.count > 0 {
            print(" event is : \(events[0].strEvent ?? "Empty")")
                events.forEach { (eventObj) in
                    let temp = UpcomingEventsViewObject(strLeague: eventObj.strLeague, dateEvent: eventObj.dateEvent, strTime: eventObj.strTime, strHomeTeam: eventObj.strHomeTeam, strAwayTeam: eventObj.strAwayTeam, idHomeTeam: eventObj.idHomeTeam, idAwayTeam: eventObj.idAwayTeam)
                    self.upcomingEvents.append(temp)
                }
                self.upcomingEventsCollectionView.reloadData()
        leagueDetailsPresenter.getTeams(strLeague: "English Premier League") { [weak self] (allTeams) in
            self?.teams=allTeams
            self?.teamscollectionview.reloadData()
            self?.leagueDetailsPresenter.getresults(idLeague: "4328") { [weak self] (events) in
                self?.latestresults=(self?.getimages.getBadges(allteams: self!.teams, allevents: events))!
                self?.latestResultCollectionView.reloadData()
            }
        })
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
extension LeagueDetailsViewController: UICollectionViewDelegateFlowLayout{
    
}
