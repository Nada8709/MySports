//
//  LeagueDetailsViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UICollectionViewDelegate{
    private let getimages = GetBadges()
    var latestresults:[LatestResultsViewObject]=[]
    var teams:[TeamsViewObject]=[]
    var upcomingEvents : [UpcomingEventsViewObject] = []
    private let favouritePresenter = FavouritePresenter()
    let appDelegate=UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var leagueNameHeader: UILabel!
    
    let identiferLatestCell = "latestCell"
    let identiferUpcomingCell = "upcomingCell"
    let identiferTeamCell = "teamCell"
    var leaguesPresenter : LeaguesDetailsPresenterProtocol = LeaguesDetailsPresenter(Remote())
    var favouriteLeagues:[LeagueViewObject]=[]
    var isFavourite:Bool=false
    var alreadyFavourite:Bool=false
    var selectedLeague : LeagueViewObject!
    var selectedTeamToTeamDetails : TeamsViewObject?
    
    @IBOutlet weak var favouriteImage: UIButton!
    @IBAction func favouriteBtn(_ sender: UIButton){
        favouriteImage.setImage(UIImage(systemName: "suit.heart.fill" ), for: .normal)
        favouritePresenter.saveLeaguetoFavourite(selectedleague: selectedLeague, appdelegate: appDelegate)
        if alreadyFavourite{
            alreadyFavourite=false
            favouritePresenter.deleteLeagueFromFavourite(selectedLeague: selectedLeague, appdelegate: appDelegate)
            presentingViewController?.reloadInputViews()
           // print(selectedLeague.strLeague)
            favouriteImage.setImage(UIImage(systemName: "suit.heart" ), for: .normal)
        }
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
        
       favouriteLeagues=favouritePresenter.getLeaguesFromFavourite(appdelegate: appDelegate)
        let ishere=favouriteLeagues.first{
             $0.idLeague == selectedLeague.idLeague
        }
        if ishere != nil{
            favouriteImage.setImage(UIImage(systemName: "suit.heart.fill" ), for: .normal)
            alreadyFavourite=true
        }
        if isFavourite{
            favouriteImage.setImage(UIImage(systemName: "suit.heart.fill" ), for: .normal)
            alreadyFavourite=true
        }
      
        self.leagueNameHeader.text = selectedLeague.strLeague
        leaguesPresenter.getTeams(strLeague: selectedLeague.strLeague) { [weak self] (allTeams) in
                self?.teams=allTeams
                self?.teamscollectionview.reloadData()
            self?.leaguesPresenter.getresults(idLeague: self?.selectedLeague.idLeague) { [weak self] (events) in
                    self?.latestresults=(self?.getimages.getBadges(allteams: self!.teams, allevents: events))!
                    self?.latestResultCollectionView.reloadData()
                }
            self?.leaguesPresenter.getUpcomingEvents(idLeague:self?.selectedLeague.idLeague,completionHandler: {[unowned self] (upcomingevents) in
                    
                    self?.upcomingEvents = (self?.getimages.getBadgesForUpComing(allteams: self!.teams, events:upcomingevents))!
                    
                    
                    self?.upcomingEventsCollectionView.reloadData()
                })
                
                
                
                
            }
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamDetailsVC = segue.destination as! TeamDetailsViewController
        teamDetailsVC.selectedTeamObj = self.selectedTeamToTeamDetails
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        if  collectionView == teamscollectionview {
            self.selectedTeamToTeamDetails = teams[indexPath.row]
        }
        
        return true
    }
    
    
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
            addShadowAndRaduisForCell(cell: cell)
            
            return cell
        }
        else if collectionView == latestResultCollectionView{
            let cell=latestResultCollectionView.dequeueReusableCell(withReuseIdentifier: identiferLatestCell, for: indexPath) as! LatestResultsCollectionViewCell
            cell.latestresult=latestresults[indexPath.row]
            addShadowAndRaduisForCell(cell:cell)
            return cell
        }
        else {
            let cell=teamscollectionview.dequeueReusableCell(withReuseIdentifier: identiferTeamCell, for: indexPath) as! TeamsCollectionViewCell
            cell.team=teams[indexPath.row]
            return cell
        }
    }
    func addShadowAndRaduisForCell(cell : UICollectionViewCell){
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
    
}


