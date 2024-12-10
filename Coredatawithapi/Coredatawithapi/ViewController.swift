//
//  ViewController.swift
//  Coredatawithapi
//
//  Created by admin on 25/11/24.
//

import UIKit

class ViewController: UIViewController{
    var jokeArr: [Jokemodel] = []
   
    

    @IBOutlet weak var tablevc: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callJokeApi()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        // Do any additional setup after loading the view.
    }
    
    func callJokeApi(){
        
      
        ApiManager().fetchjokes{ result in
            switch result {
                
            case.success(let data):
                self.jokeArr.append(contentsOf: data)
//                print(self.jokeArr)
                self.tablevc.reloadData()
                
                
            case.failure(let err):
                debugPrint("something went wrong in calling API")
               
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func data(){
        tablevc.delegate=self
        tablevc.dataSource=self
        tablevc.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "Jokecell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Jokecell", for: indexPath) as! JokeCell
        cell.idlabel.text=String(jokeArr[indexPath.row].id)
        cell.typelabel.text=jokeArr[indexPath.row].type
        cell.setuplabel.text=jokeArr[indexPath.row].setup
        cell.punchlinelabel.text=jokeArr[indexPath.row].punchline
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

