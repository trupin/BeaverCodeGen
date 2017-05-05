import Beaver

struct ExpectedState: Beaver.State {
    var error: String?

    var loading: Bool = false

    var currentScreen: CurrentScreen = .none
}

extension ExpectedState {
    /// Represents the currently shown screen
    enum CurrentScreen: Int {
        case none
        case main
    }
}

extension ExpectedState {
    public static func ==(lhs: ExpectedState, rhs: ExpectedState) -> Bool {
        return true
    }
}