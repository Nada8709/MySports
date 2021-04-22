//
//  HomePresenter.swift
//  Sports
//
//  Created by Mina Kamal on 21.04.21.
//

import Foundation
class HomePresenter: HomePresenterProtocol {
   
    
    
    
    var remoteDataSource : RemoteProtocol
    var homeVC : HomeDelegateProtocol!
    init(remoteDataSource:RemoteProtocol) {
        self.remoteDataSource = remoteDataSource
        self.homeVC = nil
    }
    
    func setDelegate(homeVC: HomeDelegateProtocol) {
        self.homeVC = homeVC
    }
    
    
    func getAllSports(completionHandler: @escaping ([Sport]) -> Void) {
        remoteDataSource.getAllSports { (allSports)in
            if(allSports.count>0){
                completionHandler(allSports)
            }else{
                print("Error")
                
            }
        }
        
    }
    
    func onSelectedItem(selectedSport: Sport) {
        homeVC.navigateToLeaguges(selectedSport: selectedSport.strSport)
    }
    
}


