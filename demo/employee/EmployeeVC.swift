//
//  EmployeeVC.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import UIKit

class EmployeeVC: UIViewController {

    //OUTLETS
    @IBOutlet weak var emplyeeTbl: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    //VARIABLES
    private var employees: [Employee]?{
        didSet{
            emplyeeTbl.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        employees = EmployeeUtility.getEmployeeData()
    }
    
    @IBAction func addEmployee(_ sender: Any) {
        navigationController?.pushViewController(NewEployeeVC(), animated: true)
    }
    
    private func setup(){
        navigationController?.viewControllers = [self]
        emplyeeTbl.dataSource = self
        emplyeeTbl.delegate = self
        emplyeeTbl.register(UINib(nibName: "EmployeeTVC", bundle: nil), forCellReuseIdentifier: "EmployeeTVC")
        addBtn.layer.cornerRadius = 4
    }
}

extension EmployeeVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTVC", for: indexPath) as! EmployeeTVC
        cell.employee = employees?[indexPath.row]
        return cell
    }
    
}
