//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by 이정민 on 2022/09/08.
//

import UIKit

class EditStockViewController: UIViewController {
    
    var observation: NSKeyValueObservation?
    var fruitStore : FruitStore?
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    func setStepperValue() {
        self.strawberryStepper.value = Double(fruitStore?.fruitsStock[Fruit.strawberry.rawValue] ?? 0)
        self.bananaStepper.value = Double(fruitStore?.fruitsStock[Fruit.banana.rawValue] ?? 0)
        self.pineappleStepper.value = Double(fruitStore?.fruitsStock[Fruit.pineapple.rawValue] ?? 0)
        self.kiwiStepper.value = Double(fruitStore?.fruitsStock[Fruit.kiwi.rawValue] ?? 0)
        self.mangoStepper.value = Double(fruitStore?.fruitsStock[Fruit.mango.rawValue] ?? 0)
    }
    
    func setStockLabel() {
        self.strawberryStockLabel.text = "\(Int(self.strawberryStepper.value))"
        self.bananaStockLabel.text = "\(Int(self.bananaStepper.value))"
        self.pineappleStockLabel.text = "\(Int(self.pineappleStepper.value))"
        self.kiwiStockLabel.text = "\(Int(self.kiwiStepper.value))"
        self.mangoStockLabel.text = "\(Int(self.mangoStepper.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStepperValue()
        setStockLabel()
        
        observation = fruitStore?.observe(\.fruitsStock, options: [.initial], changeHandler: { object, change in
            self.setStepperValue()
            self.setStockLabel()
        })
    }
    @IBAction func changeFruitStock(_ sender: UIStepper) {
        var fruit: Fruit?
        
        switch sender {
        case strawberryStepper:
            fruit = .strawberry
        case bananaStepper:
            fruit = .banana
        case pineappleStepper:
            fruit = .pineapple
        case kiwiStepper:
            fruit = .kiwi
        case mangoStepper:
            fruit = .mango
        default:
            break
        }
        
        if let fruit = fruit { fruitStore?.fruitsStock[fruit.rawValue] = Int(sender.value) }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
