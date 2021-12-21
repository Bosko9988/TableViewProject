//
//  AppDelegate.swift
//  GameLibrary
//
//  Created by Bilal Gökpinar / BBS2H20A on 21.12.21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UITableView!
    
    
    var allPersons = personData
    // Variable anlegen um die richtigen Daten anzuzeigen
    var selectedPerson: PersonModel?
    
    // Greifen auf alle zu aber wenn ich auf eins greife soll der dann das gefilterte zeigen
    var filteredPersons = personData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Zugriff auf unsere Datensätze
        myTableView.dataSource = self
        myTableView.delegate = self
        mySearchBar.delegate = self
        
        
        // Design
        // TableViewCells groeße einstellen:
        myTableView.rowHeight = 100
        
        // Damit wir das Keyboard schließen während wir Scrollen und nach was anderem suchen
        myTableView.keyboardDismissMode = .onDrag
        
    }

    // Vorbeireitung auf unsere Daten für die nächtste Seite
    // bzw nächste VC "vorbereiten" anhand des Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Zugriff auf den "Ziel VC"
        if segue.identifier == "showBeschreibung" {
            let zielTableVC = segue.destination as! BeschreibungTableViewController
            zielTableVC.person = selectedPerson
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Design - nach click auf die TableViewCell, soll diese nicht mehr "markiert" sein
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        selectedPerson = filteredPersons[indexPath.row]
        // Seque soll an dem bestimmten indexPatg der TableView ausgeführt werden
        performSegue(withIdentifier: "showBeschreibung", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    // Die Anzahl der TableViewCelle, basierend auf unser Date-Arra(-Object)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPersons.count
    }
    
    //  Was soll in der TableViewCell angezeigt werden -> CustomCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Setzen der Cell auf unsere CustomerCell mit Identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomGameTableViewCell
        
        // Bild und Text werden gesetzt, basierend auf unser Game-Objekt
        cell.personLabel.text = filteredPersons[indexPath.row].name
        cell.personImage.image = UIImage(named: filteredPersons[indexPath.row].imageName)
        
        return cell
    }
    
    
}

// Extension vom view controller:
// Search Bar braucht Datenüberprüfung
extension ViewController: UISearchBarDelegate {
    // Funktion wird ausgeführt bei jeder Eingabe in der SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // Konstante von Search Text soll immer klein angezeigt werden (lower case)
        // bzw die Eingabe vom User soll -> kleinschreibungen umgewandelt werden
        let searchText = searchText.lowercased()
        
        // Wird ausgefürt, wenn die Eingabe nicht leer ist
        if searchText != "" {
            // Unser Filter
            filteredPersons = allPersons.filter({ p in
                // Die Datensätze sollen in Klein-Schreibung umgewandelt und überprüft werden
                if p.name.lowercased().contains(searchText){
                    return true
                }
                return false
            })
        } else{
            filteredPersons = allPersons
        }
        print(filteredPersons)
        // Die TableView soll während jeder Eingabe die Veränderung auch Anzeigen bzw neu geladen werden
        self.myTableView.reloadData()
    }
    
    
    
    
    
}
