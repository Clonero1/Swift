import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

enum PossibleError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds (moneyNeeded: Int)
}

struct Product {
    var price: Int
    var count: Int
}

class Market {
    var deposit = 110
    var assortmentProduct = ["Milk": Product(price: 40, count: 10), "Bread": Product(price: 20, count: 30), "Eags": Product(price: 40, count: 0)]
    
    func saleProduct (name: String) throws {
        guard var product = assortmentProduct[name] else { throw PossibleError.invalidSelection }
        guard product.count > 0 else { throw PossibleError.outOfStock }
        guard product.price <= deposit else { throw PossibleError.insufficientFunds(moneyNeeded: product.price - deposit) }
        
        deposit -= product.price
        product.count -= 1
        assortmentProduct[name] = product
    }
}

// 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

struct SparePart {
    var price: Int
    var count: Int
}

class MarketProduct {
    var deposit = 110
    var assortmentProduct = ["Milk": Product(price: 40, count: 10), "Bread": Product(price: 20, count: 30), "Eags": Product(price: 40, count: 0)]
    
    func saleProduct (name: String) -> (Product?, PossibleError?) {
        guard var product = assortmentProduct[name] else { return (nil, PossibleError.invalidSelection) }
        guard product.count > 0 else { return (nil, PossibleError.outOfStock) }
        guard product.price <= deposit else { return (nil, PossibleError.insufficientFunds(moneyNeeded: product.price - deposit)) }
        
        deposit -= product.price
        product.count -= 1
        assortmentProduct[name] = product
        return (product, nil)
    }
}


