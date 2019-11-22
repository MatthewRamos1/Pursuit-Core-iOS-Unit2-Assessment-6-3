//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        tableView.dataSource = self

  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let crayonDetailController = segue.destination as? CrayonDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Fatal Error With prepare for segue")
        }
        crayonDetailController.crayon = Crayon.allTheCrayons[indexPath.row]
    }

}

extension CrayonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = Crayon.allTheCrayons[indexPath.row]
        
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.colorMaker()
        if cell.textLabel?.text == "Black" {
            cell.detailTextLabel?.textColor = UIColor.white
            cell.textLabel?.textColor = UIColor.white
        }
        
        return cell
        
    }
    
    
}
