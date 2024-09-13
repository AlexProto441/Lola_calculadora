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
    var estado_actual:estados_de_la_calculadora = .mostrar_resultados
    
    //Declaracion del boton y el label a interactuar
    @IBOutlet weak var btn_Cambia: UIButton!
    @IBOutlet weak var txt_Cambiar: UILabel!
    @IBOutlet weak var btn_ope: UIButton!
    
    @IBOutlet weak var ope_txt: UIButton!
    @IBOutlet weak var StackView: UIStackView!
    
    var botones_Interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual: String? = nil
    var num_anterior: Double = 0.0
    
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
            
           /* if let _mensajero_id = sender.restorationIdentifier{
                let texto_cache = botones_Interfaz[_mensajero_id]?.numero
                txt_Cambiar.text = "\(txt_Cambiar.text ?? "")\(texto_cache!)"
             */
        else if(estado_actual == estados_de_la_calculadora.mostrar_resultados){
            if let _mensajero_id = sender.restorationIdentifier{
                let txt_añadir = botones_Interfaz[_mensajero_id]?.numero
                txt_Cambiar.text = "\(txt_Cambiar.text ?? "")\(txt_añadir!)"
                estado_actual = estados_de_la_calculadora.seleccionar_numeros
            }
        }
            
        
        else if (estado_actual == estados_de_la_calculadora.escoger_operacion){
            if let _mensajero_id = sender.restorationIdentifier{
                
                operacion_actual = botones_Interfaz[_mensajero_id]?.operacion
                
                if let numero_actual: String = txt_Cambiar.text{
                    num_anterior = Double(numero_actual) ?? 0.0
                }
                txt_Cambiar.text = ""
                estado_actual = estados_de_la_calculadora.seleccionar_numeros
            }
            else {
                operacion_actual = nil
            }
        }
        
        dibujar_numeros_u_operaciones()
    }
    
    
    @IBAction func btn_escoger_operacion(_ sender: UIButton) {
        switch(estado_actual){
        case .seleccionar_numeros:
            estado_actual = .escoger_operacion
        case .escoger_operacion:
            estado_actual = .seleccionar_numeros
        case .mostrar_resultados:
            estado_actual = .escoger_operacion
        }
        
        dibujar_numeros_u_operaciones()
    }
    
    func inicializar_Calculadora() -> Void{
        crear_arreglos_botones()
        identificar_botones()
    }
    
    func crear_arreglos_botones() -> Void{
        botones_Interfaz = IUBotonCalculadora.crear_arreglo_btn()
    }
    
    func dibujar_numeros_u_operaciones(){
        switch (estado_actual){
        case .escoger_operacion:
            for elemento in botones_Interfaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(elemento.operacion, for: .normal)
                elemento.referencia_a_boton_interfaz?.setTitle("Ñ", for: .selected)
            }
        case .seleccionar_numeros:
            for elemento in botones_Interfaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(String(elemento.numero), for: .normal)
            }
        case .mostrar_resultados:
            0==0
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
    
    
    @IBAction func obtener_resultado(_ sender: Any) {
        if num_anterior != 0.0 && txt_Cambiar.text != ""{
            var numero_actual: Double = 0.0
            if let numero_actual_string = txt_Cambiar.text{
                numero_actual = Double(numero_actual_string) ?? 0.0
            }
            
            switch(operacion_actual){
            case "+":
                txt_Cambiar.text = "\(num_anterior + numero_actual)"
            case "-":
                txt_Cambiar.text = "\(num_anterior - numero_actual)"
            case "*":
                txt_Cambiar.text = "\(num_anterior * numero_actual)"
            case "/":
                txt_Cambiar.text = "\(num_anterior / numero_actual)"
                
            default:
                txt_Cambiar.text = "Hay un error"
            }
            estado_actual = estados_de_la_calculadora.mostrar_resultados
            
        }
    }
    
    
    }
    

