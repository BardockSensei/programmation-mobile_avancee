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
        monTabEtudiant.append(Etudiant(nom: "Hostache", prenom: "Guillaume", formation: "M2 CIM", groupeTP: "DT"))
        monTabEtudiant.append(Etudiant(nom: "Pedro", prenom: "Sancho", formation: "M1 Info", groupeTP: "2"))
        monTabEtudiant.append(Etudiant(nom: "Hostache", prenom: "Guillaume", formation: "M2 CIM", groupeTP: "DA"))
        monTabEtudiant.append(Etudiant(nom: "Pedro", prenom: "Sancho", formation: "M1 Info", groupeTP: "3"))
        monTabEtudiant.append(Etudiant(nom: "Hostache", prenom: "Guillaume", formation: "M2 CIM", groupeTP: "DT"))
        monTabEtudiant.append(Etudiant(nom: "Pedro", prenom: "Sancho", formation: "M1 Info", groupeTP: "2"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        creerTableauEtudiant()
        maTableView.delegate = self
        maTableView.dataSource = self
        maTableView.rowHeight = 200 // hauteur des cellules
        //loadingAnim = ODRefreshControl(in: maTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monTabEtudiant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return a cell for each row
        let aCellule = maTableView.dequeueReusableCell(withIdentifier: "idCelluleEtudiant", for: indexPath) as! CelluleEtudiant
        aCellule.miseAjourCellule(etudiant: monTabEtudiant[indexPath.row])
        if (indexPath.row % 2 == 0) {
            aCellule.backgroundColor = .blue
        } else {
            aCellule.backgroundColor = .yellow
        }
        return aCellule
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        maTableView.reloadData()
    }
    
    
}
