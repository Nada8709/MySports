//
//  UpcomingEventsCollectionViewCell.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit

class UpcomingEventsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var time: UILabel!
    
   
    @IBOutlet weak var awayImage: UIImageView!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var leagueName: UILabel!
    var upcomingEvent:UpcomingEventsViewObject?
    {
        didSet{
           
        }
    }
}
