import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ingresarLogin(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "123" && password == "123" {
            performSegue(withIdentifier: "proyecto", sender: self)
        } else {
            mostrarAlertaError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proyecto" {
            if let navController = segue.destination as? UINavigationController {
                let destinationVC = navController.topViewController as! ProyectoViewController
                destinationVC.userEmail = emailTextField.text
                destinationVC.password = passwordTextField.text
            }
        }
    }
    
    func mostrarAlertaError() {
        let alert = UIAlertController(title: "Error", message: "Credenciales inválidas. Por favor, verifica tu usuario y contraseña.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
