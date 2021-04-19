//
//  ViewController.swift
//  Sports
//
//  Created by Mina Kamal on 19.04.21.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        AF.request(Helper.leagueTeamsURL).responseDecodable(of: LeagueTeams.self) { (response) in
          guard let league = response.value else { return }
            let temp = league.teams[0].strTeam
            print(temp!)
        }    
    }
}

