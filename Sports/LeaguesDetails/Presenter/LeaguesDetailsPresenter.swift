//
//  LeaguesDetailsPresenter.swift
//  Sports
//
//  Created by Mina Kamal on 27.04.21.
//

import Foundation
class LeaguesDetailsPresenter: LeaguesDetailsPresenterProtocol {
    var remote : RemoteProtocol
    
    init(_ remote : RemoteProtocol) {
        self.remote = remote
    }
    func getUpcomingEvents(idLeague:String!,completionHandler: @escaping ([UpcomingEventsViewObject]) -> Void) {
        
        remote.getUpcomingEvents(idLeague:idLeague) { (upcomingEvents) in
            if (upcomingEvents).count > 0 {
                
                var upcomingObjects : [UpcomingEventsViewObject] = []
                upcomingEvents.forEach { (event) in
                    upcomingObjects.append(UpcomingEventsViewObject(strLeague: event.strLeague, dateEvent: event.dateEvent, strTime: event.strTime, strHomeTeam: event.strHomeTeam, strAwayTeam: event.strAwayTeam, idHomeTeam: event.idHomeTeam, idAwayTeam: event.idAwayTeam, HomeBadge: "", AwayBadge: ""))
                }
                
                completionHandler(upcomingObjects)
            }else {
                print("Error")
            }
        }
    }
    
    func getresults(idLeague: String!, completionHandler: @escaping ([LatestResultsViewObject]) -> Void) {
        remote.getLatestResults(idLeague: idLeague) { (events) in
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
        remote.getAllTeams(strLeague: strLeague) { (allTeams) in
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
