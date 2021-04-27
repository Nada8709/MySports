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
            homeImage.sd_setImage(with: URL(string: (upcomingEvent?.HomeBadge)!+"/tiny"), placeholderImage: UIImage(named: "1.jpg"))
            awayImage.sd_setImage(with: URL(string: (upcomingEvent?.AwayBadge)!+"/tiny"), placeholderImage: UIImage(named: "1.jpg"))
            leagueName.text=upcomingEvent?.strLeague
        }
    }
}
