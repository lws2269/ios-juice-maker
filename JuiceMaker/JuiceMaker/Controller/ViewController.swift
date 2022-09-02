//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore.shared

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStockLabel()
    }
    
    func setStockLabel() {
        let fruitLabelDict: [Fruit : UILabel] = [
            .strawberry : self.strawberryStockLabel,
            .banana : self.bananaStockLabel,
            .pineapple : self.pineappleStockLabel,
            .kiwi : self.kiwiStockLabel,
            .mango : self.mangoStockLabel,
        ]
        
        for (fruit, label) in fruitLabelDict {
            if let fruitAmount = try? fruitStore.fetchFruitAmount(for: fruit) {
                label.text = "\(fruitAmount)"
            }
        }
    }
    
    @IBAction func editStockButtonTapped(_ sender: UIBarButtonItem) {
        transitionView()
    }
    
    func transitionView(){
        guard let editStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") else {
            return
        }
        self.present(editStockViewController, animated: true)
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()
        
        let JuiceButtonDict: [UIButton : Juice] = [
            self.strawberryJuiceOrderButton : .strawberry,
            self.bananaJuiceOrderButton : .banana,
            self.pineappleJuiceOrderButton : .pineapple,
            self.kiwiJuiceOrderButton : .kiwi,
            self.mangoJuiceOrderButton : .mango,
            self.strawberryBananaJuiceOrderButton : .strawberryBanana,
            self.mangoKiwiJuiceOrderButton : .mangoKiwi
        ]
            
        do {
            if let juice = JuiceButtonDict[sender] {
                try juiceMaker.makeJuice(juice)
                alertSuccess(for: juice)
            }
        } catch {
            alertFailure(for: error)
        }
    }
    
    func alertSuccess(for juice: Juice) {
        let alert = UIAlertController(title: "알림", message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: "예", style: UIAlertAction.Style.default){ _ in self.viewDidLoad() }
        alert.addAction(positiveAction)
        
        self.present(alert, animated: true)
    }
    
    func alertFailure(for error: Error) {
        let alert = UIAlertController(title: "알림", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: "예", style: .default) { _ in self.transitionView() }
        let negativeAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(positiveAction)
        alert.addAction(negativeAction)
        
        self.present(alert, animated: true)
    }
}

