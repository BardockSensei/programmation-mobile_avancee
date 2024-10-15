//
//  CelluleEtudiant.swift
//  gestionnaire-cellules
//
//  Created by Guillaume Hostache on 15/10/2024.
//

import UIKit

class CelluleEtudiant: UITableViewCell 
{
    @IBOutlet var imagePhoto: UIImageView!
    
    @IBOutlet var groupeTP: UILabel!
    
    @IBOutlet var prenom: UILabel!
    
    @IBOutlet var nom: UILabel!
    
    @IBOutlet var formation: UILabel!
    
    @IBOutlet var nbAbsences: UILabel!
    
    func miseAjourCellule(etudiant: Etudiant) {
        print(etudiant)
        let img :UIImage? = UIImage.init(imageLiteralResourceName: etudiant.nomPhoto)
        imagePhoto = UIImageView.init(image: img)
        nom.text = etudiant.nom
        prenom.text = etudiant.prenom
        formation.text = etudiant.formation
    }
}
