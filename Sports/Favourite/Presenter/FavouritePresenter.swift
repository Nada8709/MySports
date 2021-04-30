//
//  FavouritePresenter.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 30/04/2021.
//

import Foundation
class FavouritePresenter: FavouritePresenterProtocol {
    let local = Local()
    func deleteLeagueFromFavourite(selectedLeague: LeagueViewObject,appdelegate: AppDelegate) {
        local.deleteLeague(selectedLeague: selectedLeague, appdelegate: appdelegate)
    }
    
    func getLeaguesFromFavourite(appdelegate: AppDelegate) -> [LeagueViewObject] {
        local.fetchLeagues(appdelegate: appdelegate)
    }
    
    func saveLeaguetoFavourite(selectedleague: LeagueViewObject,appdelegate: AppDelegate) {
        local.saveLeague(selectedLeague: selectedleague, appdelegate: appdelegate)
    }
}
