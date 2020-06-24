//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.
import Foundation

enum Manufacture: String {
    case honda, ford, toyota, isusu
}

enum actEngien {
    case engienOn, engienOff
}

enum actWindows {
    case windowsOpen, windowsClose
}

enum actTrunk {
    case trunkLoading(weight: Int), trunkUnloading(weight: Int)
}

enum actBodywork {
    case bodyworkLoading(weight: Int), bodyworkUnloading(weight: Int)
}


struct Car {
    let manufacture: Manufacture
    let year: Int
    
    var trunkVolume: Int {
        didSet {
            if trunkVolume > oldValue {
                print("В автомобиль \(manufacture.rawValue) была выполнена погрузка груза весом \(trunkVolume - oldValue) кг. Осталось \(trunkVolumeMax - trunkVolume) кг. свободного места из \(trunkVolumeMax) кг.")
            } else {
                print("Из автомобиля \(manufacture.rawValue) была выполнена разгрузка груза весом \(oldValue - trunkVolume) кг. Осталось \(trunkVolumeMax - trunkVolume) кг. свободного места из \(trunkVolumeMax) кг.")
            }
        }
    }
   
    let trunkVolumeMax: Int
    var engienAct: Bool
    var windowsAct: Bool
        mutating func turnEngien (on: actEngien) {
            switch on {
            case .engienOn:
                engienAct == true ? print("Двигатель уже был заведенный") : print("Двигатель заведен")
                engienAct = true
            case .engienOff:
                engienAct == false ? print("Двигатель уже был заглушенный") : print("Двигатель заглушен")
                engienAct = false
            }
        }
        mutating func openWindows (open: actWindows) {
            switch open {
            case .windowsOpen:
                windowsAct == true ? print("Окна уже были открыты") : print("Окна открыты")
                windowsAct = true
            case .windowsClose:
                windowsAct == false ? print("Окна уже были закрыты") : print("Окна закрыты")
                windowsAct = false
            }
    }
        mutating func trunkLoad (load: actTrunk) {
            switch load {
            case let .trunkLoading(weight):
                if trunkVolumeMax < trunkVolume + weight {
                    print("В багажнике нет свободного местя для погрузки \(weight) кг. Можно погрузить только \(trunkVolumeMax - trunkVolume) кг")
                } else {
                    print("Погрузка выполнена")
                    trunkVolume += weight
                }
            case let .trunkUnloading(weight):
                if trunkVolume - weight < 0 {
                    print("В багажнике нет такого количества для выгрузки \(weight). Можно выгрузить только \(trunkVolume) кг")
                } else {
                    print("Выгрузка выполнена")
                    trunkVolume -= weight
                }
            }
        }
    }
struct Truck {
    let manufacture: Manufacture
    let year: Int
    var bodyworkVolume: Int {
        didSet {
            if bodyworkVolume > oldValue {
                print("В автомобиль \(manufacture.rawValue) была выполнена погрузка груза весом \(bodyworkVolume - oldValue) кг. Осталось \(bodyworkVolumeMax - bodyworkVolume) кг. свободного места из \(bodyworkVolumeMax) кг.")
            } else {
                print("Из автомобиля \(manufacture.rawValue) была выполнена разгрузка груза весом \(oldValue - bodyworkVolume) кг. Осталось \(bodyworkVolumeMax - bodyworkVolume) кг. свободного места из \(bodyworkVolumeMax) кг.")
            }
        }
    }
    let bodyworkVolumeMax: Int
    var engienAct: Bool
    var windowsAct: Bool
        mutating func turnEngien (on: actEngien) {
            switch on {
            case .engienOn:
                engienAct == true ? print("Двигатель уже был заведенный") : print("Двигатель заведен")
                engienAct = true
            case .engienOff:
                engienAct == false ? print("Двигатель уже был заглушенный") : print("Двигатель заглушен")
                engienAct = false
            }
        }
        mutating func openWindows (open: actWindows) {
            switch open {
            case .windowsOpen:
                windowsAct == true ? print("Окна уже были открыты") : print("Окна открыты")
                windowsAct = true
            case .windowsClose:
                windowsAct == false ? print("Окна уже были закрыты") : print("Окна закрыты")
                windowsAct = false
            }
        }
        mutating func bodyworkLoad (load: actBodywork){
        switch load {
        case let .bodyworkLoading(weight):
            if bodyworkVolumeMax < bodyworkVolume + weight {
                print("В кузове нет свободного местя для погрузки \(weight) кг. Можно погрузить только \(bodyworkVolumeMax - bodyworkVolume) кг")
            } else {
                print("Погрузка выполнена")
                bodyworkVolume += weight
            }
        case let .bodyworkUnloading(weight):
            if bodyworkVolume - weight < 0 {
                print("В кузове нет такого количества для выгрузки \(weight) кг. Можно выгрузить только \(bodyworkVolume) кг")
            } else {
                print("Выгрузка выполнена")
                bodyworkVolume -= weight
            }
        }
    }
}

var ford = Car(manufacture: .ford, year: 2019, trunkVolume: 0, trunkVolumeMax: 320, engienAct: false, windowsAct: false)
var isusu = Truck(manufacture: .isusu, year: 2015, bodyworkVolume: 0, bodyworkVolumeMax: 20000, engienAct: false, windowsAct: false)

ford .openWindows(open: .windowsOpen)
ford .turnEngien(on: .engienOff)
ford .turnEngien(on: .engienOn)
ford .trunkLoad(load: .trunkLoading(weight: 250))
ford .trunkLoad(load: .trunkLoading(weight: 100))
ford .trunkLoad(load: .trunkUnloading(weight: 30))
ford .trunkLoad(load: .trunkLoading(weight: 100))
print(ford.trunkVolume)


isusu .openWindows(open: .windowsOpen)
isusu .turnEngien(on: .engienOn)
isusu .bodyworkLoad(load: .bodyworkLoading(weight: 10000))
isusu .bodyworkLoad(load: .bodyworkLoading(weight: 15000))
isusu .bodyworkLoad(load: .bodyworkUnloading(weight: 15000))
print(isusu.bodyworkVolume)
