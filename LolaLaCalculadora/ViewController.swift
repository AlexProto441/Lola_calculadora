//
//  ViewController.swift
//  LolaLaCalculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    //Declaracion del boton y el label a interactuar
    @IBOutlet weak var btn_Cambia: UIButton!
    @IBOutlet weak var txt_Cambiar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //La declaracion de la accion a hacer y se arrastraron cada boton a esta funcion para que otorgue su numero escrito
    @IBAction func btn_Numeros(_ sender: UIButton) {
        txt_Cambiar.text = sender.titleLabel!.text ?? "Nosupe"
    }
    
    //Declaracion del boton operacion
    @IBAction func btn_Operacion(_ sender: Any) {
        txt_Cambiar.text = "operacion"
    }
    
}

