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
    
//    func getData<T: Decodable>(from: String, decodable: T.Type, completion:@escaping (_ details: [T]) -> Void)
    
    func getUpcomingEvents(completionHandler : @escaping ([Event]) -> Void)
}
