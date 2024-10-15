//
//  Etudiant.swift
//  gestionnaire-cellules
//
//  Created by Guillaume Hostache on 15/10/2024.
//

import UIKit

class Etudiant: NSObject {
    var nom :String;
    var prenom :String;
    var formation :String;
    var groupeTP :String;
    var nomPhoto :String = "photoEtudiant.png";
    var nbAbsences :Int = 0;
    
    init(nom: String, prenom: String, formation: String, groupeTP: String) {
        self.nom = nom
        self.prenom = prenom
        self.formation = formation
        self.groupeTP = groupeTP
    }
    
}
