//
//  LeaguesPresenter.swift
//  Sports
//
//  Created by Mina Kamal on 27.04.21.
//

import Foundation
class LeaguesPresenter : LeaguesDetailsPresenterProtocol{
    
    var remote : RemoteProtocol
    
    init(_ remote : RemoteProtocol) {
        self.remote = remote
    }
    
    
    
    
    func getUpCommingEvents(completionHandler:@escaping ([Event]) -> Void{
        remote.getUpcomingEvents { (events) in
            if events.count > 0 {
                print(events[0].strCity)
            }else {
                print("Error")
            }
        }
    }
    
//    func getData(){
//
//        guard let safeURL = URL(string:Helper.upComingURL) else {
//            return
//        }
//        remote.getData(from:  Helper.upComingURL, decodable:LatestResults.self ) { (events) in
//            guard let safeDate = events[0].dateEvent else{return}
//            print(safeDate)
//        }
//    }
}
