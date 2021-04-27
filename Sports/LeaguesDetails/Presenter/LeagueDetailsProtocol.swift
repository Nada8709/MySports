//
//  LeagueDetailsProtocol.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import Foundation
protocol LeagueDetailsProtocol {
    func getTeams(strLeague : String!, completionHandler:@escaping ([TeamsViewObject]) ->Void)->Void
    func getresults(idLeague : String!, completionHandler:@escaping ([LatestResultsViewObject]) ->Void)->Void
    // func putHomeTeamBadge(idLeague : String!, completionHandler:@escaping ([LatestResultsViewObject]) ->Void)->Void
}
