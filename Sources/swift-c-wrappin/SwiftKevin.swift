import snerklor

class SwiftKevin {

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

                for i in 0..<Int(count) {
                    guard let nextItem = (intArray + i) as? UnsafeMutablePointer<Int32>, let intValue = nextItem.pointee as? Int32 else {
                        print("Int Val Not Found")
                        return -1
                    }

                    guard let nextDouble = (doubleArray + i) as? UnsafeMutablePointer<Double>, let dblVal = nextDouble.pointee as? Double else {
                        return -1
                    }

                    print("live from new york it's \(intValue) -- \(nextDouble.pointee)")
                }

                return 2501
            }
        )

        snerklor.executeAdvancedCode(&swiftCall)

    }

}