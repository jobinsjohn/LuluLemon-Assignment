//
//  AddGarmentVC.swift
//  Garments
//
//  Created by Jobins John on 2022-08-28.
//

import UIKit

class AddGarmentVC: UIViewController {

    
    @IBOutlet weak var dismissViewBtnOutlet: UIButton!
    
    @IBOutlet weak var addGarmentBtnOutlet: UIButton!
    
    @IBOutlet weak var clearTxtBtnOutlet: UIButton!
    
    @IBOutlet weak var garmentTxtOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Button Actions
    
    @IBAction func dismissViewBtnAction(_ sender: Any) {
    }

    @IBAction func addGarmentBtnAction(_ sender: Any) {
    }
    
    @IBAction func clearTxtBtnAction(_ sender: Any) {
    }
    
}
