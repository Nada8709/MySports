//
//  LeagueViewObject.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import Foundation
struct LeagueViewObject {
    let strLeague : String!
    let idLeague : String!
    let strYoutube : String!
    let strBadge : String!
    init(strLeague :String!,idLeague : String!,strYoutube : String!, strBadge : String!) {
        self.strLeague=strLeague
        self.idLeague = idLeague
        self.strYoutube = strYoutube!
        self.strBadge = strBadge!
    }
}
