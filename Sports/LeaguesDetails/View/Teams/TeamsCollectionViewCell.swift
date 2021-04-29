//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 25/04/2021.
//

import UIKit
import SDWebImage
class TeamsCollectionViewCell: UICollectionViewCell{
     
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    var team:TeamsViewObject?{
        didSet{
            teamName.text=team?.strTeam
            teamImage.sd_setImage(with: URL(string: (team?.strTeamBadge ?? "" ) ), placeholderImage: UIImage(named: "image.png"))
        }
    }
}
