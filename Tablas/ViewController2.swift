//
//  ViewController2.swift
//  Tablas
//
//  Created by Guido Magi on 08/05/2023.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet var vistaWeb: UIWebView!
    
    var nombrePdfRecibido:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelTitulo.text = nombrePdfRecibido ?? "NP"

        mostrarPdf()
        // Do any additional setup after loading the view.
        
        habilitarZoom()
    }
    
    
    func mostrarPdf(){
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        
        let datosPdf = try? Data(contentsOf: direccionPdf)
        
        vistaWeb.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
        
    }
    
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
