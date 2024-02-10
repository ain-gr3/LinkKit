//
//  Created by Ain on 2024/02/07.
//

import UIKit

extension Link where Body == Never {

    public var body: Never {
        fatalError()
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        fatalError()
    }
}

extension Never: Link {

    public typealias Body = Never
}
