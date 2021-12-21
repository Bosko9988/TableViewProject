//
//  AppDelegate.swift
//  GameLibrary
//
//  Created by Bilal Gökpinar / BBS2H20A on 21.12.21.
//

import UIKit

class BeschreibungTableViewController: UITableViewController {

    
    @IBOutlet weak var gameImageB: UIImageView!
    @IBOutlet weak var gameLabelB: UILabel!
    @IBOutlet weak var berufLabel: UILabel!
    @IBOutlet weak var geburtsdatumLabel: UILabel!
    @IBOutlet weak var familienstandLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var contactLabel: UILabel!
  
    
    // Zugriff auf das GameModel
    var person: PersonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Lösche die letzten Zeilen die frei sind
        // Desoign - leere TableViewFooterm, Falls die TableView nicht genügend Cells hat
        tableView.tableFooterView = UIView()
        
        // Falls der die Bilder nicht findet dann nim Apex als Bild
        gameImageB.image = UIImage(named: person?.imageName ?? "hausmeister")
        
        gameLabelB.text = person?.name
        berufLabel.text = person?.beruf
        familienstandLabel.text = person?.geburtsdatum
        geburtsdatumLabel.text = person?.familienstand
        adresseLabel.text = person?.adresse
        contactLabel.text = person?.contact
        
    }
    private func callNumber(phoneNumber:String) {

        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

                let alert = UIAlertController(title: ("Anrufen " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Anrufen", style: .default, handler: { (action) in
                    UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
                }))

                alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
   
    
    private func messageNumber(phoneNumber:String) {

        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

                let alert = UIAlertController(title: ("Nachricht schreiben " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Nachricht schreiben ", style: .default, handler: { (action) in
                    UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
                }))

                alert.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    
    
    @IBAction func callButton(_ sender: Any) {
        callNumber(phoneNumber: person!.contact);
    }
    
    @IBAction func messageButton(_ sender: Any) {
        messageNumber(phoneNumber: person!.contact);
    }
    
}
