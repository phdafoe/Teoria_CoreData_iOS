//
//  ViewController.swift
//  Teoria_CoreData_iOS
//
//  Created by Andres on 28/3/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: - Variables locales
    var contextManager : NSManagedObjectContext?
    var dateFormatter = DateFormatter()
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var myNombreTF: UITextField!
    @IBOutlet weak var myApellidoTF: UITextField!
    @IBOutlet weak var myEmailTF: UITextField!
    @IBOutlet weak var myDireccionTF: UITextField!
    @IBOutlet weak var myCodigoPostalTF: UITextField!
    @IBOutlet weak var myDistritoTF: UITextField!
    @IBOutlet weak var myDniTF: UITextField!
    @IBOutlet weak var myExpedienteTF: UITextField!
    @IBOutlet weak var myFaxTF: UITextField!
    @IBOutlet weak var myfechaNacimientoTF: UITextField!
    @IBOutlet weak var myFolioTF: UITextField!
    @IBOutlet weak var myMovilTF: UITextField!
    @IBOutlet weak var myNacionalidadTF: UITextField!
    @IBOutlet weak var myProvinciaTF: UITextField!
    @IBOutlet weak var myProblemaPrincipalTF: UITextField!
    @IBOutlet weak var myReferenciaConsultaTF: UITextField!
    
    
    @IBAction func salvarDatos(_ sender: Any) {
        
        guard let contextManagerDes = contextManager else {
            return
        }
        
        
        //Creamos un objeto y guardarlo
        let persona = Person(context: contextManagerDes)
        
        persona.nombre = myNombreTF.text
        persona.apellido = myApellidoTF.text
        persona.codigopostal = myCodigoPostalTF.text
        persona.direccion = myDireccionTF.text
        persona.distrito = myDistritoTF.text
        persona.dni = myDniTF.text
        persona.email = myEmailTF.text
        
        
        if let personaDes = Int64(myFaxTF.text!){
            persona.fax = personaDes
        }
        if let expedienteDes = Int16(myExpedienteTF.text!){
            persona.expediente = expedienteDes
        }
        
        if let folioDes = Int16(myFolioTF.text!){
            persona.folio = folioDes
        }
        
        
        persona.nacionalidad = myNacionalidadTF.text
        
        if let movilDes = Int64(myMovilTF.text!){
            persona.movil = movilDes
        }
        
        persona.fechaNacimiento = dateFormatter.date(from: myfechaNacimientoTF.text!) as NSDate?
        
        persona.provincia = myProvinciaTF.text
        persona.problemaPrincipal = myProblemaPrincipalTF.text
        persona.referenciaConsulta = myReferenciaConsultaTF.text
        
        
        do{
            try contextManagerDes.save()
            limpiardatos()
        }catch{
            print("Error durante el proceso de salvado de datos")
        }
        
    }
    
    @IBAction func cargarDatos(_ sender: Any) {
        
        guard let contextManagerDes = contextManager else {
            return
        }

        
        //Hacemos una consulta
        let customRequest : NSFetchRequest<Person> = Person.fetchRequest()
        //-> si no queremos todas las personas usamos un predicado -> seudo SQL atacamos el campo -> WHERE
        //let customPredicate = NSPredicate(format: "nombre = 'Andres'")
        //customRequest.predicate = customPredicate
        //-> ordenamos nuestros registros
        let sortDescriptor = NSSortDescriptor(key: "apellido", ascending: true)
        customRequest.sortDescriptors = [sortDescriptor]
        
        
        do{
            let multitud =  try contextManagerDes.fetch(customRequest)
            
            for c_persona in multitud{
                print("Nombre: \(c_persona.nombre!)\nApellido: \(c_persona.apellido!)")
            }
            
        }catch{
            print("Error consultando en CoreData")
        }
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func limpiardatos(){
        
        myNombreTF.text = ""
        myApellidoTF.text = ""
        myEmailTF.text = ""
        myDireccionTF.text = ""
        myCodigoPostalTF.text = ""
        myDistritoTF.text = ""
        myDniTF.text = ""
        myExpedienteTF.text = ""
        myFaxTF.text = ""
        myfechaNacimientoTF.text = ""
        myFolioTF.text = ""
        myMovilTF.text = ""
        myNacionalidadTF.text = ""
        myProvinciaTF.text = ""
        myProblemaPrincipalTF.text = ""
        myReferenciaConsultaTF.text = ""
        
    }


}

