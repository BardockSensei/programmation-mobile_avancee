//
//  ViewController.swift
//  gestionnaire-cellules
//
//  Created by Guillaume Hostache on 15/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var monTabEtudiant :[Etudiant] = []
    
    @IBOutlet var maTableView: UITableView!
    
    func creerTableauEtudiant() {
        for i in 0...5 {
            var etudiant :Etudiant = Etudiant(nom: "Hostache", prenom: "Guillaume", formation: "M2 CIM", groupeTP: "DT")
            
            monTabEtudiant.append(etudiant)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        creerTableauEtudiant()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monTabEtudiant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return a cell for each row
        let aCell = tableView.dequeueReusableCell(withIdentifier: "idCelluleEtudiant", for: indexPath) as! CelluleEtudiant
        return aCell
        
    }
}
