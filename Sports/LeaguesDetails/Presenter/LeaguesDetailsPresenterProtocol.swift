//
//  LeaguesDetailsPresenterProtocol.swift
//  Sports
//
//  Created by Mina Kamal on 27.04.21.
//

import Foundation
protocol LeaguesDetailsPresenterProtocol {
    func getUpcomingEvents(idLeague:String!,completionHandler: @escaping ([UpcomingEventsViewObject]) -> Void)
    func getTeams(strLeague : String!, completionHandler:@escaping ([TeamsViewObject]) ->Void)->Void
    func getresults(idLeague : String!, completionHandler:@escaping ([LatestResultsViewObject]) ->Void)->Void
}
