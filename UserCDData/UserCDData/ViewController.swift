//
//  ViewController.swift
//  UserCDData
//
//  Created by admin on 03/12/24.
//

import UIKit
import CoreData

class ViewController: UIViewController  {
    
    var BookArr:[BookModel]=[]
    
    @IBOutlet weak var tablevc: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        readToCD()
        AddToCD(bookobject: <#T##BookModel#>)
        // Do any additional setup after loading the view.
    }
}
    

    extension ViewController:UITableViewDataSource, UITableViewDelegate{
        func setup(){
            tablevc.dataSource=self
            tablevc.delegate=self
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            BookArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
            return cell
        }
        
        func AddToCD(bookobject:BookModel){
            guard let delegate=UIApplication.shared.delegate as? AppDelegate else
            {return }
            
            let managecontext=delegate.persistentContainer.viewContext
            
            guard let bookEnt=NSEntityDescription.entity(forEntityName: "Book", in: managecontext) else{
                return
            }
            
            let book = NSManagedObject(entity: bookEnt, insertInto: managecontext)
            
            book.setValue(bookobject.name, forKeyPath: "name")
            
            do {
                try managecontext.save()
                print("Save")
            } catch let err as NSError {
                print("error")
            }
        }
        
        func readToCD(){
            guard let delegate=UIApplication.shared.delegate as? AppDelegate else
            {return }
            
            let managecontext=delegate.persistentContainer.viewContext
            
            let fetchres=NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
            
            do {
                let dataArr=try managecontext.fetch(fetchres)
                for data in dataArr as! [NSManagedObject]
                {
                    let bookName = data.value(forKey: "name") as! String
                    print("name:\(bookName)")
                }
            } catch let err as NSError {
                print("error")
            }
        }
    }


