//
//  UpcomingEventsCollectionViewCell.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit
import SDWebImage
class UpcomingEventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var awayImage: UIImageView!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayName: UILabel!
    var upcomingEvent:UpcomingEventsViewObject?
    {
        didSet{
            date.text = upcomingEvent?.dateEvent
            time.text = upcomingEvent?.strTime
            
            
            homeImage.sd_setImage(with: URL(string: (upcomingEvent?.HomeBadge ?? "") ), placeholderImage: UIImage(named: "image.png"))
          //  print("home badge is : \(upcomingEvent?.HomeBadge)")
            
            //!+"/tiny"
            awayImage.sd_setImage(with: URL(string: (upcomingEvent?.AwayBadge ?? "") ), placeholderImage: UIImage(named: "image.png"))
            leagueName.text=upcomingEvent?.strLeague
        }
    }
}
