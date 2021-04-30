//
//  LocalProtocol.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 30/04/2021.
//

import Foundation
protocol LocalProtocol {
    func saveLeague(selectedLeague: LeagueViewObject,appdelegate: AppDelegate)->Void
    func fetchLeagues(appdelegate: AppDelegate) -> [LeagueViewObject]
    func deleteLeague(selectedLeague :LeagueViewObject,appdelegate: AppDelegate)->Void
}
