//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct EmptyLink: Link {

    public init() {}

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        viewController
    }
}
