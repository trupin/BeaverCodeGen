import Quick
import Nimble

@testable import BeaverCodeGen

final class StateSpecs: QuickSpec {
    override func spec() {
        describe("State") {
            describe("description") {
                it("should return a string containing the state's code") {
                    let code = State(moduleName: "Expected").description

                    self.printDiff(code: code, expected: self.expectedStateCode)

                    expect(code) == self.expectedStateCode
                }
            }
        }
    }
}