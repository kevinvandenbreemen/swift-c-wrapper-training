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
            executeAdvancedCode: { (array) in 

                //print("Size:  \(array.count)")

                guard let pointer = array else {
                    print("Pointer not available!")
                    return -1
                }

                guard let data = pointer.pointee as? Int32 else {
                    print("Could not get data...  It is a \(type(of: pointer.pointee))")
                    
                    return -1
                }

                for i in 0..<10 {
                    guard let nextItem = (pointer + i) as? UnsafeMutablePointer<Int32>, let nextVal = nextItem.pointee as? Int32 else {
                        print("Not a pointer")
                        return -1
                    }

                    print("live from new york it's \(nextVal)")
                }

                return 2501
            }
        )

        snerklor.executeAdvancedCode(&swiftCall)

    }

}