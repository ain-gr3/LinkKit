//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct PresentLink: Link {

    var viewController: UIViewController

    public init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        let presentedController = self.viewController
        await withCheckedContinuation { continuation in
            viewController.present(presentedController, animated: true) {
                continuation.resume()
            }
        }
        return presentedController
    }
}
