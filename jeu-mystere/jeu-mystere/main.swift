//
//  main.swift
//  jeu-mystere
//
//  Created by Guillaume Hostache on 10/09/2024.
//

import Foundation

func finDePartie(nombreTentatives: Int, listePropositions: [Int], reponse: Int) -> Void {
    if (nombreTentatives >= 17) {
        print("Bravo, vous avez beaucoup de chance !")
    } else if (nombreTentatives >= 14) {
        print("Bravo, très bonne stratégie avec un peu de chance...")
    } else if (nombreTentatives >= 9) {
        print("Bravo, c'est bien !")
    } else if (nombreTentatives > 0) {
        print("Bien, mais vous pouvez mieux faire...")
    } else {
        print("Perdu : ce n'est pas de chance, le nombre mystère était \(reponse)")
    }
    
    for listeProposition in listePropositions {
        print(listeProposition, separator: ", ")
    }
}

let nombreMystere = Int.random(in: 1...100)
print("TRICHE : \(nombreMystere)")

print("Veuillez entrer votre nom :")
let utilisateur :String? = readLine()
if (utilisateur != nil) {
    print("Bienvenue \(utilisateur!) !")
}

var difficulte :Int = 0
// 1 = mensonge toute les 3 tentatives

print("Nous allons jouer au jeu du nombre mystère. Quelle difficulté de jeu voulez vous ? (0 -> facile) (1 -> difficile)")
var saisie :String? = readLine()
if (saisie != nil) {
    difficulte = Int(saisie!) ?? 0
}

print("Très bien ! \n Le jeu va pouvoir débuter, trouverez vous le nombre mystère ?")

var proposition :Int = 0
var nombreTentatives :Int = 20
var propositions :[Int] = []
var frequence :Int = 0
var condition :Bool = false

repeat {
    print("(\(nombreTentatives) tentatives restantes) Tentez votre chance :")
    saisie = readLine()
    if (saisie != nil) {
        proposition = Int(saisie!) ?? -1
        if (propositions.contains(proposition)) {
            print("Vous avez déjà essayez ce nombre...")
        } else {
            nombreTentatives -= 1
            propositions.append(proposition)
            if (difficulte == 1) {
                frequence += 1
                if (frequence == 2) {
                    condition = proposition < nombreMystere
                    frequence = 0
                }
            } else {
                condition = proposition > nombreMystere
            }
            if (condition) {
                print("C'est plus petit !")
            } else {
                print("C'est plus grand !")
            }
        }
    } else {
        print("Désolé, il faut saisir un nombre valide etre 1 et 100...")
    }
} while (nombreMystere != proposition && nombreTentatives > 0)

finDePartie(nombreTentatives: nombreTentatives, listePropositions: propositions, reponse:nombreMystere)



