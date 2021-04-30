//
//  Local.swift
//  Sports
//
//  Created by Nada Ashraf Hamed on 30/04/2021.
//

import Foundation
import CoreData
class Local: LocalProtocol {
    func saveLeague(selectedLeague: LeagueViewObject, appdelegate: AppDelegate) {
        let managedcontext=appdelegate.persistentContainer.viewContext
        let entity=NSEntityDescription.entity(forEntityName: "TheLeague", in: managedcontext)
        let league=NSManagedObject(entity: entity!, insertInto: managedcontext)
        league.setValue(selectedLeague.idLeague, forKey: "idLeague")
        league.setValue(selectedLeague.strBadge, forKey: "strBadge")
        league.setValue(selectedLeague.strLeague, forKey: "strLeague")
        league.setValue(selectedLeague.strYoutube, forKey: "strYoutube")
        do{
            try managedcontext.save()
        }catch _ as NSError{
            print("Error !!!!")
        }
    }
    
    func fetchLeagues(appdelegate: AppDelegate) -> [LeagueViewObject] {
             let managedcontext=appdelegate.persistentContainer.viewContext
             var fetchedLeagues:[NSManagedObject]!
             var allLeagues:[LeagueViewObject]=[]
             let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TheLeague")
              do{
                  fetchedLeagues=try managedcontext.fetch(fetchRequest)
                  for league in fetchedLeagues{
                    let strLeague=league.value(forKey: "strLeague") as! String
                    let idLeague=league.value(forKey: "idLeague") as! String
                    let strBadge=league.value(forKey: "strBadge") as! String
                    let strYoutube=league.value(forKey: "strYoutube") as! String
                    allLeagues.append(LeagueViewObject(strLeague: strLeague, idLeague: idLeague, strYoutube: strYoutube, strBadge: strBadge))
                  }
              }catch _ as NSError{
                  print ("Error !!!")
              }
        return allLeagues
    }
    
    func deleteLeague(selectedLeague: LeagueViewObject, appdelegate: AppDelegate) {
        let managedcontext=appdelegate.persistentContainer.viewContext
        var fetchedLeagues:[NSManagedObject]!
        var deletingLeague:NSManagedObject!
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TheLeague")
         do{
             fetchedLeagues=try managedcontext.fetch(fetchRequest)
             for league in fetchedLeagues{
               let idLeague=league.value(forKey: "idLeague") as! String
                if idLeague==selectedLeague.idLeague
                {
                    deletingLeague=league
                    break
                }
               
             }
            managedcontext.delete(deletingLeague!)
          print(deletingLeague)
            try managedcontext.save()
         }catch let error as NSError{
            print ("delete Error \(error)")
         }
        print("afterdeleting")
         do{
             fetchedLeagues=try managedcontext.fetch(fetchRequest)
             for league in fetchedLeagues{
               let strLeague=league.value(forKey: "strLeague") as! String
                print(strLeague)
             }
         }catch _ as NSError{
             print ("Error !!!")
         }
        
    }
    
    
    
}
