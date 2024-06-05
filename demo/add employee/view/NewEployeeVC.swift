//
//  NewEployeeVC.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import UIKit

class NewEployeeVC: UIViewController {
    
    //OUTLETS
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    //VARIABLES
    private lazy var viewModel = AddEmployeeVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        addBtn.layer.cornerRadius = 4
    }

    @IBAction func addnewRecord(_ sender: Any) {
        viewModel.validateEmployee(name: nameTxt.text, age: ageTxt.text, address: addressTxt.text)
    }
    
}

extension NewEployeeVC : LoginResponseProtocol {
    func showError(message: String) {
        let alert = UIAlertController(title: "Alert !", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func showSuccess() {
        navigationController?.popViewController(animated: true)
    }
    
}
