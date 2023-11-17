//
//  PDFViewController.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/25/21.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "FAFSA Summary - FAFSA on the Web - Federal Student Aid", withExtension: "pdf")
        
        if let pdfDocument = PDFDocument(url: url!) {
            pdfView.autoScales = true
            pdfView.displayMode = .singlePageContinuous
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDocument
        }
        
        
        
//        if let pdfDocument = PDFDocument(data: [:]) {
//
//        }
    }
    
    

}
