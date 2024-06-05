//
//  EmployeeUtility.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import Foundation

final class EmployeeUtility {
    
    static func getEmployeeData() -> [Employee]{
        guard let empData = UserDefaults.standard.object(forKey: "employeeData") as? Data else {return []}
        do{
            let decoder = JSONDecoder()
            let employee = try decoder.decode([Employee].self, from: empData)
            return employee
        }catch _ {
            return([])
        }
    }
    
    static func saveEmployeeRecord(employee: Employee) -> Bool {
        do {
            var allEmployees = getEmployeeData()
            allEmployees.append(employee)
            
            let encoder = JSONEncoder()
            let newData = try encoder.encode(allEmployees)
            UserDefaults.standard.setValue(newData, forKey: "employeeData")
            return true
        }catch let err{
            print(err)
           return false
        }
    }
}
