//
//  AppDelegate.swift
//  GameLibrary
//
//  Created by Bilal Gökpinar / BBS2H20A on 21.12.21.

import Foundation

let personData = loadData()


// Funktion zum Laden der dekodierten JSON-Daten
func loadData() ->[PersonModel] {
    
    var data: Data
    
    
    // öffen der Datei wenn nicht gefunden wird dann gib ein Error aus
    guard let file = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("JSON ERROR")
    }
    
    // Zugriff auf die Datei des Pfadas
    data = try! Data(contentsOf: file)
    
    
    // Auslesen des Json Datei -> wird Decoded
    let decoder = JSONDecoder()
    // Datei ist da und ist auch Decodeable
    return try! decoder.decode([PersonModel].self, from: data)
}
