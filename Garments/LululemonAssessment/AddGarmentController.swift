//
//  AddGarmentController.swift
//  Assessment
//
//  Created by Jobins John on 2022-08-24.
//

import UIKit
import CoreData

protocol AddGarmentProtocol {
    func updateTableData()
}

class AddGarmentController: UIViewController {
    
    @IBOutlet weak private var txtGarment: UITextField!
    var addGarmentProtocol: AddGarmentProtocol!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Add Garment"
    }
    
    @IBAction func saveGarment(_sender: Any) {
        
        if let txtGarment = txtGarment.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if txtGarment.count == 0 {
                showAlert()
                return
            } else {
                let context = CoredataManager.shared.context
                guard let entity = NSEntityDescription.entity(forEntityName: "Garments", in: context) else { return }
                let garmentModel = NSManagedObject(entity: entity, insertInto: context) as? Garments
                garmentModel?.garmentName = txtGarment
                garmentModel?.createdTime = Date()
                do {
                    try context.save()
                    addGarmentProtocol.updateTableData()
                    self.dismiss(animated: true, completion: nil)
                } catch {
                    print("Failed Saving")
                }
            }
        
        }
    }
    
    private func showAlert() {
        
        let alertController = UIAlertController(title: "Alert", message: "Please enter garment name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
