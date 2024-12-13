//
//  ProyectoTableViewCell.swift
//  TodoList
//
//  Created by DAMII on 7/12/24.
//

import UIKit

class ProyectoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nombreProyectoTextView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
