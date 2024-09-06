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
    @IBOutlet weak var btn_ope: UIButton!
    
    var botones_Interfaz: Dictionary<String, IUBotonCalculadora>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_Calculadora()
    }
    
    //La declaracion de la accion a hacer y se arrastraron cada boton a esta funcion para que otorgue su numero escrito
    @IBAction func btn_Numeros(_ sender: UIButton) {
        //txt_Cambiar.text = sender.titleLabel!.text ?? "Nosupe"
        print(botones_Interfaz[(sender.restorationIdentifier ?? btn_ope.restorationIdentifier) ?? "btn"]?.numero ?? "Esto no funciona")
    }
    
    func inicializar_Calculadora() -> Void{
        crear_arreglos_botones()
    }
    
    func crear_arreglos_botones() -> Void{
        for numero in 0...9{
            botones_Interfaz["btn_\(numero)"] = IUBotonCalculadora(
                "btn_\(numero)",
                numero: Character("\(numero)"),
                operacion: ""
            )
        }
    }
    
    //Declaracion del boton operacion
    @IBAction func btn_Operacion(_ sender: Any) {
        txt_Cambiar.text = "operacion"
        
    }
    
}

