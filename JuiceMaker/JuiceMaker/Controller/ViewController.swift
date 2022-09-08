//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

protocol vcDelegate {
    func fe()
}

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFruitLabel()
    }
    
    func setFruitLabel() {
        do {
            self.strawberryLabel.text = "\(try juiceMaker.fruitStore.fetchFruitAmount(for: .strawberry))"
            self.bananaLabel.text = "\(try juiceMaker.fruitStore.fetchFruitAmount(for: .banana))"
            self.pineappleLabel.text = "\(try juiceMaker.fruitStore.fetchFruitAmount(for: .pineapple))"
            self.kiwiLabel.text = "\(try juiceMaker.fruitStore.fetchFruitAmount(for: .kiwi))"
            self.mangoLabel.text = "\(try juiceMaker.fruitStore.fetchFruitAmount(for: .mango))"
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func orderJuiceButton(_ sender: UIButton) {
        var juice: Juice?
        
        switch sender {
        case strawberryBananaJuiceButton:
            juice = .strawberryBanana
        case strawberryJuiceButton:
            juice = .strawberry
        case bananaJuiceButton:
            juice = .banana
        case pineappleJuiceButton:
            juice = .pineapple
        case mangoKiwiJuiceButton:
            juice = .mangoKiwi
        case kiwiJuiceButton:
            juice = .kiwi
        case mangoJuiceButton:
            juice = .mango
        default:
            break
        }
        
        if let juice = juice {
            juiceMaker.makeJuice(juice)
        }
    }
    
    @IBAction func editStockButtonTapped(_ sender: UIBarButtonItem) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "editStockViewController") as? EditStockViewController else {
            return
        }
        
        let editStockNavigationController = UINavigationController(rootViewController: editStockViewController)
        self.present(editStockNavigationController, animated: true)
    }
}
//
//extension ViewController: vcDelegate {
//    func fe() {
////        self.label.text = "123"
////        juiceMaker.change()
//    }
//}

