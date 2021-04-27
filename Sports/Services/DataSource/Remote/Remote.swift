//
//  Remote.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 21/04/2021.
//

import Foundation
import Alamofire
class Remote: RemoteProtocol {

    
    
    
    func getAllSports(completionHandler: @escaping ([Sport]) -> Void) {
        AF.request(Helper.allSportsURL).responseDecodable(of: Sports.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.sports!)
            }
        }
    }
    
    func getAllLeagues(strSport: String!, completionHandler:@escaping ([LeagueItem]) ->Void ) {
        let parameters = ["s": strSport]

        AF.request(Helper.leaguesURL,parameters: parameters).responseDecodable(of: Leagues.self) { (response) in
            if(response.data != nil){
                completionHandler((response.value)!.countrys)
            }
        }
    }
    
    
    func getUpcomingEvents(completionHandler : @escaping ([Event]) ->Void){

        AF.request(Helper.upComingURL).responseDecodable(of:UpcomingEvents.self){
            (response) in
            if response.data != nil {
                completionHandler((response.value)!.events)
            }
        }
    }
    
    
//    func getData<T: Decodable>(from: String, decodable: T.Type, completion:@escaping (_ details: [T]) -> Void) {
//        AF.request(from).responseDecodable(of: decodable.self){ (response )in
//
//            if response.data != nil {
//                completion((response.value). )
//            }
//
//        }
//    }
    
}
