import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum fillCar {
    case fuelAdd(volume: Int)
}
enum windowChange {
    case windowOpen, windowClose
}
enum engineChange {
    case engineOn, engineOff
}

protocol Car {
    var fuel: Int { get set }
    var fuelMax: Int { get }
    var window: Bool { get set }
    var engine: Bool { get set }
    func calculateFuel(act: fillCar) -> Int
}

extension Car {
    mutating func windowAct (act: windowChange) {
        switch act {
        case .windowOpen:
            guard !window else { print("Невозможно выполнить действие. Окна уже открыты"); return }
            window = true
            print("Окна открыты")
        case .windowClose:
            guard window else { print("Невозможно выполнить действие. Окна уже закрыты"); return }
            window = false
            print("Окна закрыты")        }
    }
}

extension Car {
    mutating func engineAct (act: engineChange) {
        switch act {
        case .engineOn:
            guard !engine else { print("Невозможно выполнить действие. Двигатель уже заведен"); return }
            engine = true
            print("Двигатель заведен")
        case .engineOff:
            guard engine else { print("Невозможно выполнить действие. Двигатель уже заглушен"); return }
            engine = false
            print("Двигатель заглушен")        }
    }
}

class SuperCar: Car {
    var spoiler: Bool = true
    var turbine: Bool = true
    var fuelMax = 80
    var fuel = 10
    var window: Bool = false
    var engine: Bool = false
    func calculateFuel(act: fillCar) -> Int {
        switch act {
        case let .fuelAdd(volume):
            if volume + fuel <= fuelMax {
                print("Бак пополнился на \(volume) литров. Осталось \(fuelMax - (fuel + volume)) литров свободного места")
                fuel += volume
            } else {
                print("Невозможно пополнить бак на \(volume) литров. Осталось \(fuelMax - fuel) литров свободного места")
            }
        }
        return fuel
    }
}

class TrunkCar: Car {
    var carryingCapacity: Int = 15000
    var wheelCount: Int = 6
    var fuel: Int = 30
    var fuelMax: Int = 120
    var window: Bool = false
    var engine: Bool = false
    func calculateFuel(act: fillCar) -> Int {
        switch act {
        case let .fuelAdd(volume):
            if volume + fuel <= fuelMax {
                print("Бак пополнился на \(volume) литров. Осталось \(fuelMax - (fuel + volume)) литров свободного места")
                fuel += volume
            } else {
                print("Невозможно пополнить бак на \(volume) литров. Осталось \(fuelMax - fuel) литров свободного места")
            }
        }
        return fuel
    }
}

extension SuperCar : CustomStringConvertible {
    var description: String {
       return "Автомобиль класса 'Суперкар' с установленныйм спортивным спойлером и газовой турбиной"
    }
}

extension TrunkCar : CustomStringConvertible {
    var description: String {
       return "Автомобиль класса 'Грузовой автомобиль' с установленной цистерной для перевозки жидкостей на трех шасси"
    }
}


var supra = SuperCar()
supra.calculateFuel(act: .fuelAdd(volume: 80))
supra.calculateFuel(act: .fuelAdd(volume: 70))
supra.windowAct(act: .windowOpen)
supra.windowAct(act: .windowOpen)
supra.engineAct(act: .engineOn)
supra.engineAct(act: .engineOn)
print(supra)

var truck = TrunkCar()
truck.calculateFuel(act: .fuelAdd(volume: 100))
truck.calculateFuel(act: .fuelAdd(volume: 90))
truck.windowAct(act: .windowOpen)
truck.windowAct(act: .windowOpen)
truck.engineAct(act: .engineOn)
truck.engineAct(act: .engineOn)
print(truck)




