import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

protocol HumansAmount {
    var humanNumber: Int { get set }
}

struct Queue<T: HumansAmount> {
    private var humanQueue: [T] = []
    
    mutating func push (_ item: T) {
        humanQueue.append(item)
    }
    
    mutating func pop () ->T? {
        guard humanQueue.count > 0 else {
            return nil
        }
        return humanQueue.removeFirst()
    }
    func filter (predicate: (T)) -> [T] {
        var result = [T]()
        for item in humanQueue {
            result.append(item)
        }
        return result
    }
    subscript (index: Int) -> T? {
        guard index < humanQueue.count, index >= 0 else { return nil }
        return humanQueue[index]
    }
}


