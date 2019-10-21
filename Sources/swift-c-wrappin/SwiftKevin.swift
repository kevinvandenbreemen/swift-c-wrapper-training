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

    }

}