//
//  LeaguePresenterProtocol.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import Foundation
protocol LeaguePresenterProtocol {
    func getLeagues(strSport : String!, completionHandler:@escaping ([LeagueViewObject]) ->Void)->Void
}
