//
//  ContentView.swift
//  jeu-mystere-app
//
//  Created by Guillaume Hostache on 17/09/2024.
//

import SwiftUI

func finDePartie(nombreTentatives: Int, reponse: Int) -> String {
    if (nombreTentatives >= 7) {
        return "Bravo, vous avez beaucoup de chance !"
    } else if (nombreTentatives >= 5) {
        return "Bravo, très bonne stratégie avec un peu de chance..."
    } else if (nombreTentatives >= 3) {
        return "Bravo, c'est bien !"
    } else if (nombreTentatives > 0) {
        return "Bien, mais vous pouvez mieux faire..."
    } else {
        return "Perdu !\nCe n'est pas de chance, le nombre mystère était \(reponse)..."
    }
}

struct ContentView: View {
    @State var nombreMystere :Int = Int.random(in: 1...100);
    
    @State var nbJoue :String = ""
    @State var indications :String = ""
    @State var nbTentatives :Int = 10
    @State var propositions :[Int] = []
    @State var condVictoire :Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Section titre base
            VStack {
                Text("Hello Master CIM !!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding([.bottom], 30)
                    .shadow(color: Color.black, radius: 10, x:15, y:20)
                
                Text("TP2 - Guillaume Hostache")
                    .font(.subheadline)
                    .padding([.all], 5)
            }.padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .top)
                .background(Color(.sRGB, white:0.95, opacity:1.0))
                
            // Hack pas fou pour avoir une barre bleue
            VStack {}.frame(maxWidth: .infinity, maxHeight: 5).background(Color.blue)
            
                //Section jeu
            VStack(alignment: .center) {
                Text("Jeu du Nombre Mystère").padding().font(.title)
                
                Text("Il vous reste \(nbTentatives) essais").padding(5)
                
                ProgressView(value: Double(10-nbTentatives), total: 10)
                        .padding([.top], 4)
                        .padding([.bottom], 10)
                    
                TextField("...", text: $nbJoue)
                    .padding()
                    .background(Color(.sRGB, white:0.95, opacity:1.0))
                    .foregroundColor(.blue)
                    .frame(maxWidth: 350)
                
                    HStack(spacing: 25) {
                        Button("Jouer") {
                        //print("TRICHE : \(nombreMystere)");
                        let proposition :Int = Int(nbJoue) ?? -1
                        if (proposition != -1) {
                            if (propositions.contains(proposition)) {
                                indications = "Vous avez déjà essayez ce nombre..."
                            } else {
                                nbTentatives -= 1
                                propositions.append(proposition)
                                    
                                if (proposition > nombreMystere) {
                                    indications = "Votre proposition est trop grande"
                                } else if (proposition < nombreMystere) {
                                    indications = "Votre proposition est trop petite"
                                } else {
                                    condVictoire = true
                                }
                                    
                                if (nbTentatives == 0 || condVictoire == true) {
                                    indications = finDePartie(nombreTentatives: nbTentatives, reponse: nombreMystere)
                                }
                            }
                        } else {
                            indications = "Votre proposition est incompréhensible..."
                        }
                    }.foregroundColor(Color.white)
                .disabled(nbTentatives == 0 || condVictoire == true)
                .padding()
                .fontWeight(.bold)
                .frame(maxWidth: 250)
                .background((nbTentatives == 0 || condVictoire == true) ? Color.gray : Color.blue)
                
                        Button("Nouvelle partie") {
                            condVictoire = false
                            nombreMystere = Int.random(in: 1...100)
                            nbJoue = ""
                            indications = ""
                            nbTentatives = 10
                            propositions.removeAll()
                        }.foregroundColor(Color.white)
                                    .padding()
                                    .fontWeight(.bold)
                                    .frame(maxWidth: 250).background(Color.blue)
                    }.frame(maxWidth: 350).padding()
                            
                    
                Spacer()
                
                VStack(alignment: .center) {
                    Text("\(indications)").padding()
                }.foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .top)
                    .background(Color.blue)
            }
            
        } // frame qui couvre tout l'écran, en tenant compte des bordures de l'écran
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
