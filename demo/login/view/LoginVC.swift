//
//  LoginVC.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import UIKit

class LoginVC: UIViewController {
    
    //OUTLETS
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    //VARIABLES
    private lazy var viewModel = LoginVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        navigationController?.viewControllers = [self]
        signInBtn.layer.cornerRadius = 4
    }
    
    @IBAction func doLogin(_ sender: Any) {
        viewModel.doLoginValidations(userName: userNameTxt.text, password: passwordTxt.text)
    }
    
    
}

extension LoginVC: LoginResponseProtocol {
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func showSuccess() {
        UserDefaults.standard.setValue(true, forKey: "isUserLogedIn")
        let vc = EmployeeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
