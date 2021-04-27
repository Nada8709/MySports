//
//  LeaguesDetailsPresenterProtocol.swift
//  Sports
//
//  Created by Mina Kamal on 27.04.21.
//

import Foundation
protocol LeaguesDetailsPresenterProtocol {
    func getUpcomingEvents(completionHandler : @escaping ([Event]) -> Void)
}
