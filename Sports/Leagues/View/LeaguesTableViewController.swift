//
//  LeaguesTableViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 21/04/2021.
//

import UIKit
import SDWebImage
class LeaguesTableViewController: UITableViewController {
    private let leaguePresenter = LeaguePresenter()
    
    var selectedSport : String!
    var allleagueviewobjects: ([LeagueViewObject])=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DidLoad")
        
        if let safeSelectedSport = selectedSport{
            print("selected sport is \(safeSelectedSport)")
            leaguePresenter.getLeagues(strSport: safeSelectedSport) { (allLeagues) in
                if(allLeagues.count>0){
                    self.allleagueviewobjects=allLeagues
                    self.tableView.reloadData()
                }
                else{
                    print("viewcontroller")
                }
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Leagues"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allleagueviewobjects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "leagueCell")
            as! LeagueTableViewCell
          cell.leaguename.text=allleagueviewobjects[indexPath.row].strLeague
          cell.leagueimage.sd_setImage(with: URL(string: allleagueviewobjects[indexPath.row].strBadge+"/tiny"), placeholderImage: UIImage(named: "image.png"))
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let destVC = segue.destination as! UINavigationController
        let leagueDetails = destVC.topViewController as! LeagueDetailsViewController
     //   let leagueDetails = segue.destination as! LeagueDetailsViewController
        
        var selectedLeague = allleagueviewobjects[self.tableView.indexPathForSelectedRow?.row ?? 0]
        leagueDetails.selectedIdLeague = selectedLeague.idLeague
        leagueDetails.selectedStrLeague = selectedLeague.strLeague
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
