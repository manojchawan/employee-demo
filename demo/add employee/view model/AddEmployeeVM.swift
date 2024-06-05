//
//  AddEmployeeVM.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import Foundation

protocol AddEmployeeRecordProtocol : AnyObject {
    func validateEmployee(name: String?, age: String?, address: String?)
    func saveRecords(name: String?, age: String?, address: String?)
}

final class AddEmployeeVM: AddEmployeeRecordProtocol {
    
    //VARIABLES
    weak var delegate : LoginResponseProtocol?
    
    init(delegate: LoginResponseProtocol? = nil) {
        self.delegate = delegate
    }
    
    func validateEmployee(name: String?, age: String?, address: String?) {
        if name?.isEmpty ?? true || age?.isEmpty ?? true || address?.isEmpty ?? true {
            delegate?.showError(message: "Please Enter All the Correct Data")
        }else{
            saveRecords(name: name, age: age, address: address)
        }
        
    }
    
    func saveRecords(name: String?, age: String?, address: String?) {
        let emp = Employee(name: name ?? "", age: age ?? "", address: address ?? "")
        let flag = EmployeeUtility.saveEmployeeRecord(employee: emp)
        
        if flag {
            delegate?.showSuccess()
        }else{
            delegate?.showError(message: "Something went wrong!")
        }
    }
    
}
