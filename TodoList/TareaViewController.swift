import UIKit
import CoreData

class TareaViewController: UIViewController {
    var userEmail: String?
    var password: String?
    
    @IBOutlet weak var TablaTareas: UITableView!
    
    var listaTareas = [Tarea]()
    var contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TablaTareas.delegate = self
        TablaTareas.dataSource = self
        leerTareas()
        
        if let email = userEmail, let password = password {
            print("Usuario ingresado: \(email), Contraseña: \(password)")
        }
    }
    
    @IBAction func nuevaTarea(_ sender: Any) {
        var nombreTarea = UITextField()
        let alerta = UIAlertController(title: "Nueva", message: "Tarea", preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "Agregar", style: .default) { (_) in
            let nuevaTarea = Tarea(context: self.contexto)
            nuevaTarea.nombre = nombreTarea.text
            nuevaTarea.realizado = false
            
            self.listaTareas.append(nuevaTarea)
            self.guardar()
        }
        
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alerta.addTextField { textFieldAlerta in
            textFieldAlerta.placeholder = "Escribir tu texto aquí .."
            nombreTarea = textFieldAlerta
        }
        alerta.addAction(accionAceptar)
        
        present(alerta, animated: true)
    }
    
    func guardar() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
        self.TablaTareas.reloadData()
    }
    
    func leerTareas() {
        let solicitud: NSFetchRequest<Tarea> = Tarea.fetchRequest()
        do {
            listaTareas = try contexto.fetch(solicitud)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension TareaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = TablaTareas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let tarea = listaTareas[indexPath.row]
        
        celda.textLabel?.text = tarea.nombre
        celda.textLabel?.textColor = tarea.realizado ? .black : .blue
        celda.detailTextLabel?.text = tarea.realizado ? "Completada" : "Por Completar"
        celda.accessoryType = tarea.realizado ? .checkmark : .none
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if TablaTareas.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            TablaTareas.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            TablaTareas.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        listaTareas[indexPath.row].realizado = !listaTareas[indexPath.row].realizado
        guardar()
        
        TablaTareas.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accionEliminar = UIContextualAction(style: .normal, title: "eliminar") { _, _, _ in
            self.contexto.delete(self.listaTareas[indexPath.row])
            self.listaTareas.remove(at: indexPath.row)
            self.guardar()
        }
        accionEliminar.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [accionEliminar])
    }
}
