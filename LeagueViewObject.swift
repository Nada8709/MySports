//
//  LeagueViewObject.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import Foundation
struct LeagueViewObject {
    let strSport : String!
    let idLeague : String!
    let strYoutube : String!
    let strBadge : String!
    init(strSport :String!,idLeague : String!,strYoutube : String!, strBadge : String!) {
        self.strSport=strSport
        self.idLeague = idLeague
        self.strYoutube = strYoutube!
        self.strBadge = strBadge!
    }
}
