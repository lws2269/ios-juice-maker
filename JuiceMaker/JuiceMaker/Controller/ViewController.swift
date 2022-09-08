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
    
    func alertSuccess(for juice: Juice) {
        let alert = UIAlertController(title: "알람", message: "\(juice.name) 나왔습니다. 맛있게 드세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func alertFailure(for error: Error) {
        let alert = UIAlertController(title: "알람", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        alert.addAction(UIAlertAction(title: "예", style: .default) { _ in self.transitionView() })
        
        self.present(alert, animated: true)
    }
    
    func transitionView() {
        guard let editStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "editStockViewController") as? EditStockViewController else {
            return
        }
        
        let editStockNavigationController = UINavigationController(rootViewController: editStockViewController)
        self.present(editStockNavigationController, animated: true)
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
            do {
                try juiceMaker.makeJuice(juice)
                alertSuccess(for: juice)
            } catch {
                alertFailure(for: error)
            }
        }
    }
    
    @IBAction func editStockButtonTapped(_ sender: UIBarButtonItem) {
        transitionView()
    }
}
//
//extension ViewController: vcDelegate {
//    func fe() {
////        self.label.text = "123"
////        juiceMaker.change()
//    }
//}

