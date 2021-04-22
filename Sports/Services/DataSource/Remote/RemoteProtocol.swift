//
//  RemoteProtocol.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 21/04/2021.
//

import Foundation
protocol RemoteProtocol {
    func getAllLeagues(strSport: String!, completionHandler:@escaping ([LeagueItem]) ->Void )
    
    
    func getAllSports(completionHandler : @escaping ([Sport]) -> Void )
}
