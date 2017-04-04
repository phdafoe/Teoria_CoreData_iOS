//
//  Person+Uitls.swift
//  Teoria_CoreData_iOS
//
//  Created by Andres on 28/3/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation

extension Person {
    
    func nombreApellido() -> String{
        return "\(String(describing: self.nombre)) \(String(describing: self.apellido))"
    }
    
    func datosPersonales() -> String{
        return "\(String(describing: self.fechaNacimiento)) \(String(describing: self.dni)) \(self.movil)"
    }
}
