//
//  Created by Ain
//

import UIKit

public protocol Link {

    associatedtype Body: Link

    @LinkBuilder var body: Body { get }

    @MainActor func start(by viewController: UIViewController) async throws -> UIViewController
}

public extension Link {

    @discardableResult
    @MainActor func start(by viewController: UIViewController) async throws -> UIViewController {
        try await body.start(by: viewController)
    }
}
