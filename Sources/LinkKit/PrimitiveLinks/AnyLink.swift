//
//  Created by Ain on 2024/02/08.
//

import UIKit

public struct AnyLink: Link {

    var link: any Link

    public init(_ link: any Link) {
        self.link = link
    }

    public var body: any Link {
        link
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        try await link.start(by: viewController)
    }
}
