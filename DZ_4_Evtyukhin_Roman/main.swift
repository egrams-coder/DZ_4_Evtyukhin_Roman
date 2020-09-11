//
//  main.swift
//  DZ_4_Evtyukhin_Roman
//
//  Created by Роман on 11.09.2020.
//  Copyright © 2020 Nebo. All rights reserved.
//
// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

// 2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.

// 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

// 6. Вывести значения свойств экземпляров в консоль.


import Foundation

enum Brand {
    case ferrari, lamborghini, tesla, porsche
}
enum Model {
    case roma, urus, x, boxter
}
enum Body {
    case sedan, suv, cabriolet, compartment
}
enum Transmission {
    case robot, automatic, svt
}
enum Fuel {
    case disel, petrol, gas, electro
}
enum RadiusDisks {
    case r19, r20, r21, r22
}
enum Spoiler {
    case open, closed
}
enum Engine {
    case on, off
}
enum NitrousOxide {
    case connected, disabled
}

class Car {
    var brand: Brand
    var model: Model
    var body: Body
    var transmission: Transmission
    var fuel: Fuel
    var radiusDisks: RadiusDisks
    var spoiler: Spoiler
    
    init(brand: Brand, model: Model, body: Body, transmission: Transmission, fuel: Fuel, radiusDisks: RadiusDisks, spoiler: Spoiler) {
        self.brand = brand
        self.model = model
        self.body = body
        self.transmission = transmission
        self.fuel = fuel
        self.radiusDisks = radiusDisks
        self.spoiler = spoiler
        
    }
    func openSpoiler() {
        spoiler = .open
    }
    func closedSpoiler() {
        spoiler = .closed
    }
}


class Ferrari: Car {
    static var spoilerCount = 0
    static var ferrariCount = 0
    override func openSpoiler() {
        if self.spoiler == .open {
            print("В \(brand) \(model) спойлер отсутствует! Открыть невозможно!")
            Ferrari.spoilerCount += 1
        }
        self.spoiler = .closed
    }
    var nitrousOxide: NitrousOxide {
        willSet {
            print("Внимание! Водитель выполняет манипуляции с закисью азота!")
        }
        didSet {
            if self.nitrousOxide == .connected {
                print("Закись азота - \(nitrousOxide)")
                
            } else if self.nitrousOxide == .disabled {
                print("Закись азота - \(nitrousOxide)")
            }
        }
    }
    override init(brand: Brand, model: Model, body: Body, transmission: Transmission, fuel: Fuel, radiusDisks: RadiusDisks, spoiler: Spoiler) {
        self.nitrousOxide = .disabled
        super.init(brand: brand, model: model, body: body, transmission: transmission, fuel: fuel, radiusDisks: radiusDisks, spoiler: spoiler)
        Ferrari.ferrariCount += 1
    }
    deinit {
        Ferrari.ferrariCount -= 1
        print("Одна \(brand) утилизирована!")
    }
    static func ferrariCountInfo() {
        print("Количество ferrari в гараже: \(ferrariCount)")
        ferrari2 = nil
        print("Количество ferrari в гараже: \(ferrariCount)")
        print("Количество попыток открытия спойлера: \(spoilerCount)")
    }
    func printFerrari() {
        print("Марка: \(brand)")
        print("Модель: \(model)")
        print("Кузов: \(body)")
        print("КПП: \(transmission)")
        print("Топливо: \(fuel)")
        print("Диски: \(radiusDisks)")
        openSpoiler()
        print("Спойлер: \(spoiler)")
        Ferrari.ferrariCountInfo()
        
    }
}
var ferrari1 = Ferrari(brand: .ferrari, model: .roma, body: .compartment, transmission: .automatic, fuel: .petrol, radiusDisks: .r21, spoiler: .open)
var ferrari2: Ferrari? = Ferrari(brand: .ferrari, model: .roma, body: .compartment, transmission: .automatic, fuel: .petrol, radiusDisks: .r21, spoiler: .open)
var ferrari3 = Ferrari(brand: .ferrari, model: .roma, body: .compartment, transmission: .robot, fuel: .petrol, radiusDisks: .r21, spoiler: .open)
ferrari3 = ferrari1


class Lamborghini: Car {
    override func closedSpoiler() {
        
        if self.spoiler == .closed {
            print("В \(brand) \(model) спойлер всегда в открытом состоянии! Закрыть невозможно!")
        }
        self.spoiler = .open
    }
    func printLamborghini() {
        print("Марка: \(brand)")
        print("Модель: \(model)")
        print("Кузов: \(body)")
        print("КПП: \(transmission)")
        print("Топливо: \(fuel)")
        print("Диски: \(radiusDisks)")
        closedSpoiler()
        print("Спойлер: \(spoiler)")
        
    }
}
var lamborghini = Lamborghini(brand: .lamborghini, model: .urus, body: .suv, transmission: .robot, fuel: .disel, radiusDisks: .r22, spoiler: .closed)


class Tesla: Car {
    override func openSpoiler() {
        if self.spoiler == .open {
            print("В \(brand) \(model) спойлер отсутствует! Открыть невозможно!")
        } else {
            print("Комплектация \(brand) \(model) без спойлера ")
        }
        self.spoiler = .closed
    }
    func printTesla() {
        print("Марка: \(brand)")
        print("Модель: \(model)")
        print("Кузов: \(body)")
        print("КПП: \(transmission)")
        print("Топливо: \(fuel)")
        print("Диски: \(radiusDisks)")
        openSpoiler()
        print("Спойлер: \(spoiler)")
        
    }
}
var tesla = Tesla(brand: .tesla, model: .x, body: .sedan, transmission: .svt, fuel: .electro, radiusDisks: .r19, spoiler: .closed)


class Porsche: Car {
    var engine: Engine {
        willSet {
            print("Внимание! Водитель выполняет манипуляции с двигателем!")
        }
        didSet {
            if self.engine == .on {
                print("Двигатель \(brand) \(model) - \(Engine.on)")
                self.spoiler = .open
                print("Спойлер: \(spoiler)")
            }
            if self.engine == .off {
                print("Двигатель \(brand) \(model) - \(Engine.off)")
                self.spoiler = .closed
                print("Спойлер: \(spoiler)")
            }
        }
    }
    init(brand: Brand, model: Model, body: Body, transmission: Transmission, fuel: Fuel, radiusDisks: RadiusDisks, spoiler: Spoiler, engine: Engine) {
        self.engine = engine
        super.init (brand: brand, model: model, body: body, transmission: transmission, fuel: fuel, radiusDisks: radiusDisks, spoiler: spoiler)
    }
    override func closedSpoiler() {
        switch (engine, spoiler) {
        case (.off, .open):
            self.spoiler = .closed
            print("Внимание! В \(brand) \(model) спойлер открывается автоматически при старте двигателя!")
        case (.on, .closed):
            self.spoiler = .open
            print("Внимание! В \(brand) \(model) спойлер закрывается автоматически при стопе двигателя!")
        default:
            print("Внимание! В \(brand) \(model) спойлер авоматический!")
        }
    }
    func printPorsche() {
        print("Марка: \(brand)")
        print("Модель: \(model)")
        print("Кузов: \(body)")
        print("КПП: \(transmission)")
        print("Топливо: \(fuel)")
        print("Диски: \(radiusDisks)")
        closedSpoiler()
        print("Спойлер: \(spoiler)")
        
    }
}
var porsche = Porsche(brand: .porsche, model: .boxter, body: .cabriolet, transmission: .automatic, fuel: .gas, radiusDisks: .r20, spoiler: .closed, engine: .on
)


print("---------------------")
ferrari1.printFerrari()
ferrari1.nitrousOxide = .connected
print("---------------------")
lamborghini.printLamborghini()
print("---------------------")
tesla.printTesla()
print("---------------------")
porsche.printPorsche()
porsche.engine = .off
print("---------------------")




