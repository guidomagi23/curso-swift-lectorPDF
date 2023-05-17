//
//  ViewController.swift
//  Tablas
//
//  Created by Guido Magi on 08/05/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contenidoCeldas = ["pdf1", "pdf2", "pdf3"]
    var idPdfSeleccionado: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
    }
    
    @IBOutlet var tabla: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let celda = UITableViewCell()
        let celda = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idPdfSeleccionado = indexPath.row
        let celdaSeleccionada = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "pantallaDosSegue", sender: celdaSeleccionada)
    }

    
    //let idPdfSeleccionadoRecibido = sender as! NSIndexPath
    //Después crear otra variable para obtener el numero del row:
    //let idx = idPdfSeleccionadoRecibido.row
    
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   if segue.identifier == "pantallaDosSegue" {
      //      let idPdfSeleccionadoRecibido = sender as! NSIndexPath
       //     print ("nombre del pdf:", contenidoCeldas[idPdfSeleccionadoRecibido.row])
            //let idx = idPdfSeleccionadoRecibido.row
        //    let objPantalla2:ViewController2 = segue.destination as! ViewController2
       //     objPantalla2.nombrePdfRecibido = contenidoCeldas[idPdfSeleccionadoRecibido.row]
        //}
        
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
            if let celdaSeleccionada = sender as? UITableViewCell,
               let indexPath = tabla.indexPath(for: celdaSeleccionada) {
                let objPantalla2 = segue.destination as! ViewController2
                objPantalla2.nombrePdfRecibido = contenidoCeldas[indexPath.row]
            }
        }
    }
}
    

        

