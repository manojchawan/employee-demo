//
//  EmployeeTVC.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import UIKit

class EmployeeTVC: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var employee: Employee?{
        didSet{
            name.text = employee?.name
            age.text = "Age: \(employee?.age ?? "")"
            address.text = employee?.address
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
