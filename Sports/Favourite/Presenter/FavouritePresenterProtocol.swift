//
//  FavouritePresenterProtocol.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 30/04/2021.
//

import Foundation
protocol FavouritePresenterProtocol {
    func getLeaguesFromFavourite(appdelegate: AppDelegate) -> [LeagueViewObject]
    func saveLeaguetoFavourite(selectedleague: LeagueViewObject,appdelegate: AppDelegate)-> Void
    func deleteLeagueFromFavourite(selectedLeague: LeagueViewObject,appdelegate: AppDelegate)->Void
}

