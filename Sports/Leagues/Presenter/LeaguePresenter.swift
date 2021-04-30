//
//  LeaguePresenter.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import Foundation
class LeaguePresenter: LeaguePresenterProtocol {
    
    private var  remotedatasource : RemoteProtocol?
    private var leaguesVC  : LeaguesTableProtocol?
    
    init(remote : RemoteProtocol) {
        self.remotedatasource = remote
        self.leaguesVC = nil
    }
    func setDelegate(leaguesVC:LeaguesTableProtocol) {
        self.leaguesVC = leaguesVC
    }
    
    func getLeagues(strSport: String!, completionHandler:@escaping ([LeagueViewObject]) ->Void)->Void {
        remotedatasource?.getAllLeagues(strSport: strSport) { (allLeagues) -> Void in
            var allleagueviewobjects: ([LeagueViewObject])=[]
            for league in allLeagues{
                allleagueviewobjects.append(LeagueViewObject(strLeague: league.strLeague, idLeague: league.idLeague, strYoutube: league.strYoutube, strBadge: league.strBadge))
            }
            if(allleagueviewobjects.count>0){
                completionHandler(allleagueviewobjects)
            }
            else{
                print("LeaguePresenter")
            }
        }
        
    }
    func onItemSelected(itemSelected: LeagueViewObject) {
        leaguesVC?.navigateToLeagueDetails(selectedIdLeague: itemSelected.idLeague, selectedStrLeague: itemSelected.strLeague)
    }
    
    
}



