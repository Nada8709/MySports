//
//  LeagueTableViewCell.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    
    @IBAction func leagueyoutube(_ sender: UIButton) {
    }
    @IBOutlet weak var leaguename: UILabel!
    @IBOutlet weak var leagueimage: UIImageView!
    @IBOutlet weak var cellview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
