//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by 이정민 on 2022/09/08.
//

import UIKit

class EditStockViewController: UIViewController {
    
    var stock: [Fruit : Int] = [:]
    var juiceMakerDelegate: juiceMakerDelegate?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStepperValue()
        setFruitLabel()
    }
    
    func setStepperValue() {
        self.strawberryStepper.value = Double(stock[.strawberry] ?? 0)
        self.bananaStepper.value = Double(stock[.banana] ?? 0)
        self.pineappleStepper.value = Double(stock[.pineapple] ?? 0)
        self.kiwiStepper.value = Double(stock[.kiwi] ?? 0)
        self.mangoStepper.value = Double(stock[.mango] ?? 0)
    }
    
    func setFruitLabel() {
        self.strawberryLabel.text = "\(Int(self.strawberryStepper.value))"
        self.bananaLabel.text = "\(Int(self.bananaStepper.value))"
        self.pineappleLabel.text = "\(Int(self.pineappleStepper.value))"
        self.kiwiLabel.text = "\(Int(self.kiwiStepper.value))"
        self.mangoLabel.text = "\(Int(self.mangoStepper.value))"
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        juiceMakerDelegate?.changeFruits(stock: self.stock)
        self.dismiss(animated: true)
    }
    
    @IBAction func changeFruit(_ sender: UIStepper) {
        
        var fruit: Fruit?
        let value = Int(sender.value)
        
        switch sender {
        case strawberryStepper:
            self.strawberryLabel.text = "\(value)"
            fruit = .strawberry
        case bananaStepper:
            self.bananaLabel.text = "\(value)"
            fruit = .banana
        case pineappleStepper:
            self.pineappleLabel.text = "\(value)"
            fruit = .pineapple
        case kiwiStepper:
            self.kiwiLabel.text = "\(value)"
            fruit = .kiwi
        case mangoStepper:
            self.mangoLabel.text = "\(value)"
            fruit = .mango
        default:
            break
        }
        
        if let fruit = fruit {
            stock[fruit] = value
        }
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
