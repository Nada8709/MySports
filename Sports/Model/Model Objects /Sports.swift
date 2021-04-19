//
//  Sports.swift
//  Sports
//
//  Created by Mina Kamal on 19.04.21.
//
import Foundation

// MARK: - Welcome
struct Sports: Codable {
    let sports: [Sport]!
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String!
    let strFormat: StrFormat!
    let strSportThumb, strSportThumbGreen: String!
    let strSportDescription: String!
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
