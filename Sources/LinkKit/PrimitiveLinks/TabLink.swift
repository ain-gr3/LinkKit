//
//  Created by Ain on 2024/02/07.
//

import UIKit

public struct TabLink: Link {

    var index: Int

    public init(index: Int) {
        self.index = index
    }

    public func start(by viewController: UIViewController) async throws -> UIViewController {
        guard let tabBarController = viewController.tabBarController else {
            throw LinkError.tabBarNotFound
        }
        guard let viewControllers = tabBarController.viewControllers, viewControllers.count > index else {
            throw LinkError.selectedTabNotFound
        }
        tabBarController.selectedIndex = index
        return viewControllers[index]
    }
}
