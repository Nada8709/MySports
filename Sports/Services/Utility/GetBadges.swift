//
//  GetBadges.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 27/04/2021.
//

import Foundation
class GetBadges{
    func getBadges(allteams:[TeamsViewObject],allevents:[LatestResultsViewObject])->[LatestResultsViewObject] {
        print(allteams.count)
        var latestresults : [LatestResultsViewObject] = []
        for event in allevents{
            let homebadge=allteams.first{
                 $0.idTeam == event.idHomeTeam
            }?.strTeamBadge
            let awaybadge=allteams.first{
                $0.idTeam == event.idAwayTeam
            }?.strTeamBadge
            latestresults.append(LatestResultsViewObject(strHomeTeam: event.strHomeTeam, strAwayTeam: event.strAwayTeam, intHomeScore: event.intHomeScore, intAwayScore: event.intAwayScore, dateEvent: event.dateEvent, strTime: event.strTime, idHomeTeam: event.idHomeTeam, idAwayTeam: event.idAwayTeam, HomeBadge: homebadge, AwayBadge: awaybadge))
        }
        return latestresults
    }
    func getBadgesForUpComing(allteams:[TeamsViewObject],events:[UpcomingEventsViewObject])->[UpcomingEventsViewObject] {
        var upcomingEvents : [UpcomingEventsViewObject] = []
        events.forEach { (eventObj) in
            let homebadge=allteams.first{
                 $0.idTeam == eventObj.idHomeTeam
            }?.strTeamBadge
            let awaybadge=allteams.first{
                $0.idTeam == eventObj.idAwayTeam
            }?.strTeamBadge
            let temp = UpcomingEventsViewObject(strEvent: eventObj.strEvent, strLeague: eventObj.strLeague, dateEvent: eventObj.dateEvent, strTime: eventObj.strTime, strHomeTeam: eventObj.strHomeTeam, strAwayTeam: eventObj.strAwayTeam, idHomeTeam: eventObj.idHomeTeam, idAwayTeam: eventObj.idAwayTeam, HomeBadge:homebadge, AwayBadge: awaybadge)
            upcomingEvents.append(temp)
        }
      
        return upcomingEvents
    }

    
    
    
    
}
