//
//  ViewController.swift
//  calculatrice-polonaise
//
//  Created by Guillaume Hostache on 01/10/2024.
//

import UIKit

class ViewController: UIViewController 
{
    @IBOutlet var myInputDisplayLabel: UILabel!

    @IBAction func clicDigit(_ sender: Any) {
        let button :UIButton = sender as! UIButton;
        myInputDisplayLabel.text = "Clique sur la touche \(button.tag)"
    }
    
    @IBAction func clicEnter(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Enter"
    }
    
    @IBAction func clicDrop(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Drop"
    }
    
    @IBAction func clicDiv(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Division (/)"
    }
    
    @IBAction func clicMul(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Multiplication (*)"
    }
    
    @IBAction func clicAdd(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Addition (+)"
    }
    
    @IBAction func clicMinus(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Soustraction (-)"
    }
    
    @IBAction func clicPoint(_ sender: Any) {
        myInputDisplayLabel.text = "Clique sur la touche Point (.)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

