//
//  LeaguesViewController.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 20/04/2021.
//

import UIKit

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    private let leaguePresenter = LeaguePresenter()
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell=leaguestableview.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    

   
    @IBOutlet weak var leaguestableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DidLoad")
        leaguestableview.delegate=self
        leaguestableview.dataSource=self
        leaguePresenter.getLeagues(strSport: " ") { (allLeagues) in
            if(allLeagues.count>0){
                
            }
            else{
                print("viewcontroller")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
