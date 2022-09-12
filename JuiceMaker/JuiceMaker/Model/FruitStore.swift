//
//  JuiceMaker - FruitStore.swift
//  Created by stone, jpush.
//

import Foundation

// 과일 저장소 타입
class FruitStore: NSObject {
    @objc dynamic var fruitsStock: NSMutableDictionary = [
        Fruit.strawberry.rawValue : 10,
        Fruit.banana.rawValue : 10,
        Fruit.pineapple.rawValue : 10,
        Fruit.mango.rawValue : 10,
        Fruit.kiwi.rawValue : 10
    ]
    
    func useFruits(for recipe: [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fetchFruitAmount(for: fruit)
            self.fruitsStock[fruit.rawValue] = fruitAmount - amount
        }
    }

    func fetchFruitAmount(for fruit: Fruit) throws -> Int {
        guard let fruitAmount = fruitsStock[fruit.rawValue] else {
            throw JuiceMakerError.fruitExistError
        }
        return 0
//        return fruitAmount as? Int ??
    }
}
