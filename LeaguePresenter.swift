//
//  LeaguePresenter.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import Foundation
import Alamofire
class LeaguePresenter: LeaguePresenterProtocol {
    private let remotedatasource = Remote()
   /* var getLeagueItems:([LeagueItem]) ->([LeagueViewObject]) = {
        (allLeagues:[LeagueItem]) in
        var allleagueviewobjects: ([LeagueViewObject])=[]
        for league in allLeagues{
            allleagueviewobjects.append(LeagueViewObject(strSport: league.strSport, idLeague: league.idLeague, strYoutube: league.strYoutube, strBadge: league.strBadge))
        }
        return allleagueviewobjects
    }*/
    
    func getLeagues(strSport: String!, completionHandler:@escaping ([LeagueViewObject]) ->Void)->Void {
        remotedatasource.getAllLeagues(strSport: "") { (allLeagues) -> Void in
            var allleagueviewobjects: ([LeagueViewObject])=[]
            for league in allLeagues{
                allleagueviewobjects.append(LeagueViewObject(strSport: league.strSport, idLeague: league.idLeague, strYoutube: league.strYoutube, strBadge: league.strBadge))
            }
            if(allleagueviewobjects.count>0){
                completionHandler(allleagueviewobjects)
            }
            else{
                print("LeaguePresenter")
            }
        }

        }
    
    }
    
   

