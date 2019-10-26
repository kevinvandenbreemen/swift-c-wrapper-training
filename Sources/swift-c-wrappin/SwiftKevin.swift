import snerklor

class NumPrinter{

    func printInt(i: Int32) {
        print("The number is \(i)")
    }

}

class SwiftKevin {

    static let printers: [NumPrinter] = [NumPrinter(), NumPrinter()]    

    static func doSomeStaticWork(ints: [Int32], doubles: [Double]) {
        print("Static function called:  ints=\(ints), doubles=\(doubles)")

        printers.forEach {pr in 
            ints.forEach{ num in 
                pr.printInt(i: num)
            }
                
        }

    }

    func doSomethingWithMyself() {
        print("Dis something")
    }

    func printGreeting() {
        snerklor.printHello()
        snerklor.printANumber(42)
        snerklor.printANumber(777)

        //  Proof of concept of calling swift from C
        //  See also https://forums.swift.org/t/best-way-to-call-a-swift-function-from-c/9829/3
        var callback = CallbackIntoSwift (
            callSwiftFromC: { (number) in
                print("Swift project \(number)")
            }
        )

        snerklor.callSwift(&callback)

        //  Trying to send data like arrays etc and return data
        var swiftCall = CallbackWithArray(
            executeAdvancedCode: { (count, intArray, doubleArray) in 

                guard let intArray = intArray, let doubleArray = doubleArray else {
                    debugPrint("Missing Data.  Cannot do aything")
                    return -11
                }

                print("Type of count=\(type(of: count))")

                var ints: [Int32] = []
                var doubles: [Double] = []

                for i in 0..<Int(count) {
                    guard let nextItem = (intArray + i) as? UnsafeMutablePointer<Int32>, let intValue = nextItem.pointee as? Int32 else {
                        print("Int Val Not Found")
                        return -1
                    }

                    guard let nextDouble = (doubleArray + i) as? UnsafeMutablePointer<Double>, let dblVal = nextDouble.pointee as? Double else {
                        return -1
                    }

                    ints.append(intValue)
                    doubles.append(dblVal)

                    print("live from new york it's \(intValue) -- \(nextDouble.pointee)")
                }

                //doSomethingWithMyself()
                SwiftKevin.doSomeStaticWork(ints: ints, doubles: doubles)
                return 2501
            }
        )

        snerklor.executeAdvancedCode(&swiftCall)

    }

}