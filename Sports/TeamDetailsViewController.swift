//
//  TeamDetailsViewController.swift
//  Sports
//
//  Created by Mina Kamal on 28.04.21.
//

import UIKit
import SDWebImage
class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageTeam: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamYear: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamStaduim: UILabel!
    @IBOutlet weak var socialView: UIView!
    var selectedTeamObj : TeamsViewObject?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = true

//        containerView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        socialView.layer.cornerRadius = 10.0
        socialView.layer.masksToBounds = true

        if let safeSelectedTeamObj = selectedTeamObj {
            print(safeSelectedTeamObj.strFacebook ?? "Empty")
            
            displayTeamData(team: safeSelectedTeamObj)
        }else {
            print("Error in viewDidLoad in TeamDetailsViewController")
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func webBtn(_ sender: UIButton) {
        
        navigateToLink(nameOfLink: selectedTeamObj?.strWebsite)

    }
    
    @IBAction func twitterBtn(_ sender: UIButton) {
        navigateToLink(nameOfLink: selectedTeamObj?.strTwitter)

    }
    @IBAction func faceBookBtn(_ sender: UIButton) {
        navigateToLink(nameOfLink: selectedTeamObj?.strFacebook)

    }
    @IBAction func youtubeBtn(_ sender: Any) {
        navigateToLink(nameOfLink: selectedTeamObj?.strYoutube)
    }
    
    func navigateToLink(nameOfLink : String?) {
        if let safelink =  nameOfLink , !(nameOfLink?.isEmpty ?? false) {
            UIApplication.shared.open(URL(string: "http://"+safelink)!)
        }else {
            showAlert(title:"Sorry",message: "Link not found")
        }
        
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func displayTeamData (team:TeamsViewObject){
        imageTeam.sd_setImage(with: URL(string: team.strTeamBadge ?? ""), placeholderImage: UIImage(named: "image.png"))
        
        teamCountry.text = team.strCountry
        teamName.text  = team.strTeam
        teamYear.text = team.intFormedYear
        teamStaduim.text = team.strStadium
        leagueName.text = team.strLeague
        print("youtube link is \(String(describing: team.strYoutube))")
        print("facebook  link is \(String(describing: team.strFacebook))")
        print("tweeter link is \(String(describing: team.strTwitter))")
        print("website link is \(String(describing: team.strWebsite))")
        
    }
    
    
    func showAlert(title:String,message:String)  {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                case .destructive:
                print("destructive")
                
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
