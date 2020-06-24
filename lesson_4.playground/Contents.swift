import UIKit

enum Manufacture {
    case BMW, ford, opel
}
enum LightChange {
    case lightOn, lightOff
}
enum TrunkDoorChange {
    case trunkDoorOpen, trunkDoorClose
}
enum SpoilerChange {
    case spoilerUp, spoilerDown
}
enum FuelChange {
    case fuelAdd(volume: Int)
}
class Car {
    let manufacture: Manufacture
    var color = UIColor()
    var wheelNumber: Int
    var light = false
    func lightAct (act: LightChange) {
        switch act {
        case .lightOn:
            light == true ? print("Невозможно выполнить действие. Фары уже включены") : print("Фары включены")
            light == true
        case .lightOff:
            light == false ? print("Невозможно выполнить действие. Фары уже выключены") : print("Фары выключены")
            light == false
        }
    }
    var fuel = 10
    func fillCar(act: FuelChange) {
        
    }
    init ( manufacture: Manufacture, wheelNumber: Int, color: UIColor ) {
        self.manufacture = manufacture
        self.color = color
        self.wheelNumber = wheelNumber
    }
}
class SportCar: Car {
    let passengerNumber = 2
    let doorNumber = 2
    var spoiler = true
    let fuelMax = 80
    func spoilerAct (act: SpoilerChange) {
        switch act {
        case .spoilerUp:
            spoiler == true ? print("Невозможно выполнить действие. Спойлер уже поднят") : print("Спойлер поднят")
            spoiler = true
        case .spoilerDown:
            spoiler == false ? print("Невозможно выполнить действие. Спойлер уже опущен") : print("Спойлер опущен")
            spoiler = false
        }
    }
    override func fillCar (act: FuelChange) {
        super.fillCar (act:)
        switch act {
        case let .fuelAdd(volume):
            if fuel + volume < fuelMax {
                print("Автомобиль заправлен. В баке \(fuel + volume) литров топлива из \(fuelMax) литров")
                fuel += volume
            } else {
                print("Невозможно залить \(volume) литров топлива. В баке только \(fuelMax - fuel) литров свободного места")
            }
        }
    }
}
class TrunkCar: Car {
    var passengerNumber = 5
    let doorNumber = 4
    let fuelMax = 50
    var trunkDoor = false
    func trunkDoorAct (act: TrunkDoorChange) {
        switch act {
        case .trunkDoorOpen:
            trunkDoor == true ? print("Невозможно выполнить действие. Дверь багажника уже открыта") : print("Дверь багажника открыта")
            trunkDoor = true
        case .trunkDoorClose:
            trunkDoor == false ? print("Невозможно выполнить действие. Дверь багажника уже закрыта") : print("Дверь багажника закрыта")
        }
    }
    override func fillCar (act: FuelChange) {
        super.fillCar(act:)
        switch act {
        case let .fuelAdd(volume):
            if fuel + volume < fuelMax {
                print("Автомобиль заправлен. В баке \(fuel + volume) литров топлива из \(fuelMax) литров")
                fuel += volume
            } else {
                print("Невозможно залить \(volume) литров топлива. В баке только \(fuelMax - fuel) литров свободного места")
            }
        }
    }
}

let bmw = SportCar(manufacture: .BMW, wheelNumber: 4, color: .gray)

bmw.lightAct(act: .lightOn)
bmw.spoilerAct(act: .spoilerUp)
bmw.spoilerAct(act: .spoilerDown)
bmw.fillCar(act: .fuelAdd(volume: 60))
bmw.fillCar(act: .fuelAdd(volume: 30))

let opel = TrunkCar(manufacture: .opel, wheelNumber: 4, color: .blue)

opel.lightAct(act: .lightOn)
opel.trunkDoorAct(act: .trunkDoorOpen)
opel.trunkDoorAct(act: .trunkDoorClose)
opel.fillCar(act: .fuelAdd(volume: 30))
opel.fillCar(act: .fuelAdd(volume: 20))
