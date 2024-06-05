//
//  ViewController.swift
//  demo
//
//  Created by Manoj Chvan on 05/06/24.
//

import UIKit

class ViewController: UIViewController {

    //VARIABLES
    var isUserLoggedIn: Bool{
        return UserDefaults.standard.bool(forKey: "isUserLogedIn")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showSplash()
    }

    func showSplash(){
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            if self?.isUserLoggedIn ?? false{
                //navigate to home
                self?.navigate(vc: EmployeeVC())
            }else{
                //navigate to login
                self?.navigate(vc: LoginVC())
            }
        }

    }
    
    func navigate(vc: UIViewController){
        navigationController?.pushViewController(vc, animated: true)
    }
}

