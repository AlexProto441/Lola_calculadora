//
//  ViewController.swift
//  LolaLaCalculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit

enum estados_de_la_calculadora{
    case seleccionar_numeros
    case escoger_operacion
    case mostrar_resultados
}

class ViewController: UIViewController {
    var estado_actual:estados_de_la_calculadora = estados_de_la_calculadora.seleccionar_numeros
    
    //Declaracion del boton y el label a interactuar
    @IBOutlet weak var btn_Cambia: UIButton!
    @IBOutlet weak var txt_Cambiar: UILabel!
    @IBOutlet weak var btn_ope: UIButton!
    
    
    @IBOutlet weak var StackView: UIStackView!
    
    var botones_Interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_Calculadora()
    }
    
    //La declaracion de la accion a hacer y se arrastraron cada boton a esta funcion para que otorgue su numero escrito
    @IBAction func btn_Numeros(_ sender: UIButton) {
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            
            let txt_añadir = botones_Interfaz[(sender.restorationIdentifier ?? btn_ope.restorationIdentifier) ?? "btn"]?.numero
            txt_Cambiar.text = "\(txt_Cambiar.text ?? "")\(txt_añadir!)"
            }
        else if (estado_actual == estados_de_la_calculadora.escoger_operacion){
            if let _mensajero: UIButton? = sender{
                operacion_actual = botones_Interfaz[_mensajero!.restorationIdentifier ?? "btn_0"]?.operacion
            }
            else {
                operacion_actual = nil
            }
        }
        
        dibujar_numeros_u_operaciones()
    }
    
    
    @IBAction func btn_escoger_operacion(_ sender: UIButton) {
        if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            estado_actual = estados_de_la_calculadora.escoger_operacion
            dibujar_numeros_u_operaciones()
        }
    }
    
    func inicializar_Calculadora() -> Void{
        crear_arreglos_botones()
        identificar_botones()
    }
    
    func crear_arreglos_botones() -> Void{
        botones_Interfaz = IUBotonCalculadora.crear_arreglo_btn()
    }
    
    func dibujar_numeros_u_operaciones(){
        if (estado_actual == estados_de_la_calculadora.escoger_operacion){
        }
        else if (estado_actual == estados_de_la_calculadora.escoger_operacion){
            for elemento in botones_Interfaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(String(elemento.numero), for: .normal)
            }
        }
    }
    
    func identificar_botones(){
        for pila_de_componentes in StackView.subviews{
            for botones in pila_de_componentes.subviews{
                //print(botones.restorationIdentifier)
                if let identificador = botones.restorationIdentifier{
                    botones_Interfaz[identificador]?.referencia_a_boton_interfaz = botones as? UIButton
                }
            }
        }
        
        
        }
    }
    

