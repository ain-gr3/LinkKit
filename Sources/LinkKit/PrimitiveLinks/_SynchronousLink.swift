//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct _SynchronousLink: Link {

    var _links: [any Link]

    init(value: [any Link]) {
        self._links = value
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        var parentViewController = viewController
        for link in _links {
            parentViewController = try await link.start(by: parentViewController)
        }
        return parentViewController
    }
}
