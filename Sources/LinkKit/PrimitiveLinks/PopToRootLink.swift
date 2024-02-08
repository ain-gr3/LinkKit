//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct PopToRootLink: Link {

    public init() {}

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        guard let navigationController = viewController.navigationController else {
            throw LinkError.navigationNotFound
        }
        let rootController = navigationController.viewControllers.first

        _ = navigationController.popToRootViewController(animated: true) ?? []
        if let coordinator = navigationController.transitionCoordinator {
            await withCheckedContinuation { continuation in
                coordinator.animate(alongsideTransition: nil) { _ in
                    continuation.resume()
                }
            }
        }
        return rootController ?? viewController
    }
}
