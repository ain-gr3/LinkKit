//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct PushLink: Link {

    var viewControllers: [UIViewController]

    public init(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }

    public init(_ viewController: UIViewController) {
        self.init([viewController])
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        let navigationController = viewController.navigationController
            ?? (viewController as? UINavigationController)
        guard let navigationController else {
            throw LinkError.navigationNotFound
        }
        let viewControllers = navigationController.viewControllers + viewControllers
        navigationController.setViewControllers(viewControllers, animated: true)

        if let coordinator = viewController.transitionCoordinator {
            await withCheckedContinuation { continuation in
                coordinator.animate(alongsideTransition: nil) { _ in
                    continuation.resume()
                }
            }
        }
        return viewControllers.last!
    }
}
