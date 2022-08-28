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
    
    func initUI()
    {
        garmentTxtOutlet.delegate = self
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
        self.dismiss(animated: true)
    }

    @IBAction func addGarmentBtnAction(_ sender: Any) {
    }
    
    @IBAction func clearTxtBtnAction(_ sender: Any) {
    }
    
}

extension AddGarmentVC: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == garmentTxtOutlet {
                        let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
                        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                        let typedCharacterSet = CharacterSet(charactersIn: string)
                        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                        return alphabet
              } else {
                return false
            }
    }
}
