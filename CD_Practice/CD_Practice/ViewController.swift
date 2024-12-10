//
//  ViewController.swift
//  CD_Practice
//
//  Created by admin on 20/11/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addcoredata(jokeobject: Jokemodel(id: 1, type: "abc", setup: "xyz", punchline: "dfghjfds" ))
        readfromcoredata()
        // Do any additional setup after loading the view.
    }
    func addcoredata(jokeobject:Jokemodel){
        guard let delegate=UIApplication.shared.delegate as? AppDelegate else
        {return }
        
        let managecontext=delegate.persistentContainer.viewContext
        
        guard let jokeEntity=NSEntityDescription.entity(forEntityName: "Jokes", in: managecontext) else{
            return
        }
        
        let joke=NSManagedObject(entity: jokeEntity, insertInto: managecontext)
        
        joke.setValue(jokeobject.id, forKey:"id")
        joke.setValue(jokeobject.punchline, forKey: "punchline")
        joke.setValue(jokeobject.setup, forKey: "setup")
        joke.setValue(jokeobject.type, forKey: "type")
        
        
        do{
            try
            managecontext.save()
            debugPrint("Core data saved")
        }
        catch let err as NSError {
                    debugPrint("could not save to CoreData. Error: \(err)")
                }
    }
    
    func readfromcoredata(){
        guard let delegate=UIApplication.shared.delegate as? AppDelegate else
        {return }
        
        let managecontext=delegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Jokes")
        
        do{
            let res = try managecontext.fetch(fetchRequest)
            debugPrint("fetch from CD sucessfully")
            
            for data in res as! [NSManagedObject]{
                print(data.value(forKey: "id") as! Int)
                print(data.value(forKey: "type") as! String)
                print(data.value(forKey: "setup") as! String)
                print(data.value(forKey:"punchline") as! String)
            }
            
        }
        catch let err as NSError {
                    debugPrint("could not save to CoreData. Error: \(err)")
                }
        
    }
}

