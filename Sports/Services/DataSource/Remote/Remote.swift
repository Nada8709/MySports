//
//  Remote.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 21/04/2021.
//

import Foundation
import Alamofire
class Remote: RemoteProtocol {

    func getLatestResults(idLeague: String!, completionHandler: @escaping ([Events]) -> Void) {
        let parameters = ["id": idLeague]

        AF.request(Helper.LatestResultsURL,parameters: parameters).responseDecodable(of: LatestResults.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.events)
            }
        }
    }
    
    func getAllTeams(strLeague: String!, completionHandler: @escaping ([Team]) -> Void) {
        let parameters = ["l": strLeague]

        AF.request(Helper.leagueTeamsURL,parameters: parameters).responseDecodable(of: TeamsinLeague.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.teams)
            }
        }
    }
    
    func getAllSports(completionHandler: @escaping ([Sport]) -> Void) {
        AF.request(Helper.allSportsURL).responseDecodable(of: Sports.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.sports!)
            }
        }
    }
    
    func getAllLeagues(strSport: String!, completionHandler:@escaping ([LeagueItem]) ->Void ) {
        let parameters = ["s": strSport]

        AF.request(Helper.leaguesURL,parameters: parameters).responseDecodable(of: Leagues.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.countrys)
            }
        }
    }
    
}
