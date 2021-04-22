//
//  HomePresenterProtocol.swift
//  Sports
//
//  Created by Mina Kamal on 21.04.21.
//

import Foundation
protocol HomePresenterProtocol {
    func setDelegate(homeVC:HomeDelegateProtocol)
  func  getAllSports(completionHandler: @escaping ([Sport]) -> Void)
    
    func onSelectedItem(selectedSport:Sport)
}
