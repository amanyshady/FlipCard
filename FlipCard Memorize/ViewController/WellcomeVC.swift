//
//  WellcomeVC.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 19/03/2023.
//

import UIKit

class WellcomeVC: UIViewController {
    
    
    @IBOutlet weak var createCardBtn: UIButton!
    
    @IBOutlet weak var memorizeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI() {
        createCardBtn.roundedButn()
        memorizeBtn.roundedButn()
        
    }


}

