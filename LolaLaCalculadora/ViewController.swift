//
//  ViewController.swift
//  LolaLaCalculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    var estado_actual:
    
    //Declaracion del boton y el label a interactuar
    @IBOutlet weak var btn_Cambia: UIButton!
    @IBOutlet weak var txt_Cambiar: UILabel!
    @IBOutlet weak var btn_ope: UIButton!
    
    var botones_Interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_Calculadora()
    }
    
    //La declaracion de la accion a hacer y se arrastraron cada boton a esta funcion para que otorgue su numero escrito
    @IBAction func btn_Numeros(_ sender: UIButton) {
        let txt_añadir = botones_Interfaz[(sender.restorationIdentifier ?? btn_ope.restorationIdentifier) ?? "btn"]?.numero
        txt_Cambiar.text = "\(txt_Cambiar.text ?? "")\(txt_añadir!)"
    }
    else if (estado_actual == estado_de_la_calculadora.escoger_operacion){
        let sender: UIButton
        operacion_actual == botones_Interfaz[]
    }
    
    
    
    
    func inicializar_Calculadora() -> Void{
        crear_arreglos_botones()
    }
    
    func crear_arreglos_botones() -> Void{
        botones_Interfaz = IUBotonCalculadora.crear_arreglo_btn()
    }
    
    func dibujar_numeros_u_operaciones(){
        if (estado_actual == estado_de_la_calculadora.escoger_operacion)
    }
    
    else if (estado_actual == estade_de_la_calculadora)
    
    //Declaracion del boton operacion
    @IBAction func btn_Operacion(_ sender: Any) {
        txt_Cambiar.text = "operacion"
        
    }
    
}

