//
//  AppDelegate.swift
//  GameLibrary
//
//  Created by Bilal Gökpinar / BBS2H20A on 21.12.21.
//

import UIKit

class CustomGameTableViewCell: UITableViewCell {

    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Bilder haben eine einheitliche Groeße 
        personImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
