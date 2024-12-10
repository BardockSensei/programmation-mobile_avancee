//
//  dataTools.swift
//  gps
//
//  Created by Guillaume Hostache on 10/12/2024.
//

import Foundation
import UIKit

func miseAjourData(controlleur: ViewController){
    // A compléter question 2.1 a): Creation URL
    let url = URL(string: "https://kerautret.github.io/SiteVrac/strikeSample.dat")
    var contenuFichier = ""
    let task = URLSession.shared.dataTask(with: url!) { [controlleur] data,
        response,
        error in
        if error != nil {
            print(error!.localizedDescription)
        } else {
            DispatchQueue.main.async {
                contenuFichier = String(data: data!, encoding: .utf8)!
               
                controlleur.monChampTexte.text = contenuFichier
                
                controlleur.analyseData()
                
            }
        }
    }
    
    task.resume()
    
    
    
}
