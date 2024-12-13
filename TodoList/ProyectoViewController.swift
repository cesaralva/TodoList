//
//  ProyectoViewController.swift
//  TodoList
//
//  Created by DAMII on 7/12/24.
//

import UIKit
struct Proyecto{
    var proyecto : String?
    var tipoProyecto : String?
}
class ProyectoViewController: UIViewController, UITableViewDataSource {
  
    
    var userEmail: String?
    var password: String?
    
    
    


   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = userEmail, let password = password {
            print("Usuario ingresado: \(email), Contraseña: \(password)")
        }        // Do any additional setup after loading the view.
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }



    @IBAction func agregarButton(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
