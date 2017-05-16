import Beaver

final class RouterPool {
    let parentRouter: Router<AppRoute>

    let context: Context

    init(parentRouter: Router<AppRoute>,
         context: Context) {
        self.parentRouter = parentRouter
        self.context = context
    }
}

extension RouterPool {
    func expectedRouter(initialState: ExpectedState) -> Router<ExpectedRoute> {
        return Router<ExpectedRoute>.expected(parentRouter: parentRouter,
                                              context: context,
                                              initialState: initialState)
    }
}

final class AppPresenter: Beaver.Presenting {
    typealias ActionType = AppAction

    weak var weakStore: Store<AppAction>?

    let context: Context

    let initialState: AppState

    // Register your middlewares here
    let middlewares: [Store<AppAction>.Middleware]

    fileprivate lazy var routers: RouterPool = {
        RouterPool(parentRouter: self.router, self.context)
    }()

    init(context: Context,
         initialState: ExpectedState,
         middlewares: [Store<ExpectedAction>.Middleware]) {
        self.context = context
        self.initialState = initialState
        self.middlewares = middlewares
    }
}

extension AppPresenter {
    func stateDidUpdate(oldState: AppState?,
                        newState: AppState,
                        completion: @escaping () -> ()) {
        if oldState?.currentRoute != newState.currentRoute {
            router.emit(newState.currentRoute)
        }
    }
}