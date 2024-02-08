//
//  Created by Ain
//

import UIKit

public protocol Link {

    associatedtype Body: Link

    @LinkBuilder var body: Body { get }

    @MainActor func start(by viewController: UIViewController) async throws -> UIViewController
}

extension Link {

    @MainActor func start(by viewController: UIViewController) async throws -> UIViewController {
        try await body.start(by: viewController)
    }
}
