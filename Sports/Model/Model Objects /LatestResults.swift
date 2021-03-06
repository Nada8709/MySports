//
//  LatestResults.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import Foundation
struct LatestResults : Codable {
    let events : [Events]!
}

struct Events : Codable {
    let idEvent : String!
    let idSoccerXML : String!
    let idAPIfootball : String!
    let strEvent : String!
    let strEventAlternate : String!
    let strFilename : String!
    let strSport : String!
    let idLeague : String!
    let strLeague : String!
    let strSeason : String!
    let strDescriptionEN : String!
    let strHomeTeam : String!
    let strAwayTeam : String!
    let intHomeScore : String!
    let intRound : String!
    let intAwayScore : String!
    let intSpectators : String!
    let strOfficial : String!
    let strHomeGoalDetails : String!
    let strHomeRedCards : String!
    let strHomeYellowCards : String!
    let strHomeLineupGoalkeeper : String!
    let strHomeLineupDefense : String!
    let strHomeLineupMidfield : String!
    let strHomeLineupForward : String!
    let strHomeLineupSubstitutes : String!
    let strHomeFormation : String!
    let strAwayRedCards : String!
    let strAwayYellowCards : String!
    let strAwayGoalDetails : String!
    let strAwayLineupGoalkeeper : String!
    let strAwayLineupDefense : String!
    let strAwayLineupMidfield : String!
    let strAwayLineupForward : String!
    let strAwayLineupSubstitutes : String!
    let strAwayFormation : String!
    let intHomeShots : String!
    let intAwayShots : String!
    let strTimestamp : String!
    let dateEvent : String!
    let dateEventLocal : String!
    let strTime : String!
    let strTimeLocal : String!
    let strTVStation : String!
    let idHomeTeam : String!
    let idAwayTeam : String!
    let strResult : String!
    let strVenue : String!
    let strCountry : String!
    let strCity : String!
    let strPoster : String!
    let strSquare : String!
    let strFanart : String!
    let strThumb : String!
    let strBanner : String!
    let strMap : String!
    let strTweet1 : String!
    let strTweet2 : String!
    let strTweet3 : String!
    let strVideo : String!
    let strStatus : String!
    let strPostponed : String!
    let strLocked : String!
    
}
