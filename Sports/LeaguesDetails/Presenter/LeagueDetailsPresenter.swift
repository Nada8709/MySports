//
//  LeagueDetailsPresenter.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 26/04/2021.
//

import Foundation
class LeagueDetailsPresenter: LeagueDetailsProtocol {
    
    private let remotedatasource = Remote()
    func getresults(idLeague: String!, completionHandler: @escaping ([LatestResultsViewObject]) -> Void) {
        remotedatasource.getLatestResults(idLeague: idLeague) { (events) in
            var latestResultsViewObject : [LatestResultsViewObject]=[]
            for event in events{
                latestResultsViewObject.append(LatestResultsViewObject(strHomeTeam: event.strHomeTeam, strAwayTeam: event.strAwayTeam, intHomeScore: event.intHomeScore, intAwayScore: event.intAwayScore, dateEvent: event.dateEvent, strTime: event.strTime, idHomeTeam: event.idHomeTeam, idAwayTeam: event.idAwayTeam, HomeBadge: "", AwayBadge: ""))
            }
            if(latestResultsViewObject.count>0){
                completionHandler(latestResultsViewObject)
            }
            else{
                print("latestResultsViewObject")
            }

        }
    }
    
    
    
    func getTeams(strLeague: String!, completionHandler: @escaping ([TeamsViewObject]) -> Void) {
        remotedatasource.getAllTeams(strLeague: strLeague) { (allTeams) in
            var allTeamsViewObjects : [TeamsViewObject]=[]
            for team in allTeams{
                allTeamsViewObjects.append(TeamsViewObject(idTeam: team.idTeam, strTeamBadge: team.strTeamBadge, strTeam: team.strTeam))
            }
            if(allTeamsViewObjects.count>0){
                completionHandler(allTeamsViewObjects)
            }
            else{
                print("LeagueDetailsPresenter")
            }
        }
    }
    
}
