//
//  LatestResultsCollectionViewCell.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class LatestResultsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeTeam: UILabel!
    
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var awayImage: UIImageView!
    var latestresult:LatestResultsViewObject?
    {
        didSet{
            date.text=latestresult?.dateEvent
            time.text=latestresult?.strTime
            awayTeam.text=latestresult?.strAwayTeam
            homeTeam.text=latestresult?.strHomeTeam
            homeScore.text=latestresult?.intHomeScore
            awayScore.text=latestresult?.intAwayScore
         
        }
    }
}
