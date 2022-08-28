//
//  ViewController.swift
//  Garments
//
//  Created by Jobins John on 2022-08-24.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var orderSelectorOutlet: UISegmentedControl!
    
    @IBOutlet weak var garmentTableViewOutlet: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garmentTableViewOutlet.dataSource = self
        garmentTableViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }

    func initUI(){
        
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func addGarmentBtnAction(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "addGarmentSegueIdentifier", sender: self)
    }
    

}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let garmentCell = tableView.dequeueReusableCell(withIdentifier: "GarmentCellIdentifier") as? GarmentTableViewCell else {
            fatalError("Cell creation failed")
        }
        
        guard let textLabel = garmentCell.textLabel else {
            fatalError("Error in finding text label")
        }
        
        textLabel.text = "Garment Name"
        
        return garmentCell
    }
    
    
}
