//
//  ViewController.swift
//  gps
//
//  Created by Guillaume Hostache on 10/12/2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var monChampTexte: UITextView!
    
    @IBOutlet weak var maMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maMap.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func chargementDonnees(_ sender: Any) {
        miseAjourData(controlleur: self)
    }
    
    @IBAction func analyseDonnees(_ sender: Any) {
        analyseData()
    }
    
    var mapTypeCounter = 0
    @IBAction func changeMapStyle(_ sender: Any) {
        if mapTypeCounter == 0{
            maMap.mapType = MKMapType.standard
            mapTypeCounter = mapTypeCounter + 1
        } else if mapTypeCounter == 1 {
            maMap.mapType = MKMapType.satellite
            mapTypeCounter = mapTypeCounter + 1
        } else if mapTypeCounter == 2 {
            maMap.mapType = MKMapType.hybrid
            mapTypeCounter = 0
        }
    }
    
    
    func analyseData() {
        var tabLignes = monChampTexte.text.components(separatedBy: "\n")
        print(tabLignes)
        var tabInfos : [ [String] ] = []
        for i in 0...tabLignes.count-1{
            let str = tabLignes[i].components(separatedBy: " ")
            tabInfos.append(str)
            print("\(tabInfos[i][2]), \(tabInfos[i][3]) ")
            
            let lat = Double(tabInfos[i][2])!
            let lng = Double(tabInfos[i][3])!
            
            var coords = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng))
            
            var object = LightningImpact(coordinate: coords, title: tabInfos[i][0], subtitle: tabInfos[i][4])
            maMap.addAnnotation(object)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var resultat = MKAnnotationView(annotation: annotation, reuseIdentifier: "Lightning")
        
        let img = UIImage(named: "lightningIconColor0-2")
        resultat.image = img
        return resultat
    }
    
}

