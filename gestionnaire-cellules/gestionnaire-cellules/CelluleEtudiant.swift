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
        imagePhoto.image = UIImage(named: etudiant.nomPhoto)
        nom.text = etudiant.nom
        prenom.text = etudiant.prenom
        formation.text = etudiant.formation
        groupeTP.text = etudiant.groupeTP
        nbAbsences.text = "Nb Absences : \(etudiant.nbAbsences)"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
