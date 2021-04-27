//
//  LeaguesDetailsPresenter.swift
//  Sports
//
//  Created by Mina Kamal on 27.04.21.
//

import Foundation
class LeaguesDetailsPresenter: LeaguesDetailsPresenterProtocol {
    var remote : RemoteProtocol
    
    init(_ remote : RemoteProtocol) {
        self.remote = remote
    }
    func getUpcomingEvents(completionHandler: @escaping ([Event]) -> Void) {
        remote.getUpcomingEvents { (events) in
            if events.count > 0 {
                completionHandler(events)
            }else {
                print("Error")
            }
        }
    }
    
    
}
