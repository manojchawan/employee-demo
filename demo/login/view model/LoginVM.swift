//
//  LoginVM.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import Foundation

protocol LoginProtocol: AnyObject {
    func doLoginValidations(userName: String?, password: String?)
}

protocol LoginResponseProtocol: AnyObject {
    func showError(message: String)
    func showSuccess()
}

final class LoginVM: LoginProtocol {
    
    //VARIABLES
    weak var delegate: LoginResponseProtocol?
    init(delegate: LoginResponseProtocol? = nil) {
        self.delegate = delegate
    }
    
    func doLoginValidations(userName: String?, password: String?) {
        if userName?.isEmpty ?? true {
            delegate?.showError(message: "UserName is Missing")
            return
        }else if password?.isEmpty ?? true {
            delegate?.showError(message: "Password is Missing")
            return
        }
        
        //make API CALL but since API is not working doing direct login and navigation
        delegate?.showSuccess()
    }
}
