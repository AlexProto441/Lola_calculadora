//
//  ViewController.swift
//  LolaLaCalculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    //Declaracion del boton y el label a interactuar
    @IBOutlet weak var btn_Interaccion: UIButton!
    @IBOutlet weak var txt_Cambiar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //La declaracion de la accion a hacer
    @IBAction func btn_Pushar_Boton(_ sender: Any) {
        txt_Cambiar.text="Ya fugaaaaaa"
    }
    
}

