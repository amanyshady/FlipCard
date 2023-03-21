//
//  CreateCardVC.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 21/03/2023.
//

import UIKit

class CreateCardVC: UIViewController {
    
    @IBOutlet weak var quesTxtField: UITextField!
    
    @IBOutlet weak var answerTxtField: UITextField!
    
    var viewModel : CreateCardViewModel
    
    
    init(viewModel : CreateCardViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
      
        self.viewModel = CreateCardViewModel()
        super.init(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initVM()
        self.addTarget()
    }
   
    
    func addTarget() {
        
        
        answerTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
        
        quesTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
    }
    
    func initVM() {
       
        self.viewModel.showEmptyTxtAlert = { [weak self] in
            
            guard let hasEmptyTxt =  self?.viewModel.hasEmptyTxtField else {
               return
                
            }
            
            if hasEmptyTxt {
                
                var message = ""
                if !(self?.viewModel.messingDataMesg.0.isEmpty)! {
                  
                    message = (self?.viewModel.messingDataMesg.0)!
                    self?.quesTxtField.warningBorder()
                    
                }else if !(self?.viewModel.messingDataMesg.1.isEmpty)! {
                   
                 
                    message = (self?.viewModel.messingDataMesg.1)!
                    self?.answerTxtField.warningBorder()
                }
                
                let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                
                self?.present(alert, animated: true)
            }
            
        }
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        
        self.viewModel.checkEmptyTxtField(quesText: quesTxtField.text ?? "" , answerTxt: answerTxtField.text ?? "")
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {

        if textField == quesTxtField {
            
            quesTxtField.normalBorder()
        }
        
        if textField == answerTxtField {
            
            answerTxtField.normalBorder()
        }
    }
    

}

