//
//  ContentView.swift
//  jeu-mystere-app
//
//  Created by Guillaume Hostache on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State var nbJoue :String = "";
    let nombreMystere = Int.random(in: 1...100)
    @State var indications :String = "";
    //var victoire :Boolean = false;
    @State var nbTentatives :Int = 10;
    
    var body: some View {
        VStack(spacing: 0) {
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
            }   .padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight:0, maxHeight: 150, alignment: .top)
                .background(Color(.sRGB, white:0.95, opacity:1.0))
                
            // Hack pour avoir une barre bleue
            VStack {}.frame(maxWidth: .infinity, maxHeight: 5)
                .background(Color.blue)
            
            VStack(alignment: .center) {
                Text("Jeu du Nombre Mystère")
                    .padding()
                    .font(.title)
                
                Text("Nombres d'essais restants : ").padding()
                
                TextField("...", text: $nbJoue)
                    .padding()
                    .background(Color(.sRGB, white:0.95, opacity:1.0))
                    .foregroundColor(.blue)
                
                Button("Jouer") {
                    print("TRICHE : \(nombreMystere)")
                    let proposition :Int = Int(nbJoue) ?? -1
                    print("Saisie : \(proposition)")
                    
                    if (proposition > nombreMystere) {
                        indications = "Votre proposition est trop grande";
                    } else if (proposition < nombreMystere) {
                        indications = "Votre proposition est trop petite"
                    } else {
                        indications = "Gagné !"
                    }
                }.padding()
                
                Spacer()
                VStack {
                    Text("Indications : \(indications)")
                        .padding()
                }
                    .foregroundColor(.white)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 100,
                        alignment: .top
                    )
                    .background(Color.blue)
            }
            
        }// frame qui couvre tout l'écran, en tenant compte des bordures de l'écran
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
