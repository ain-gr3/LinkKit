//
//  Created by Ain Obara on 2024/02/10.
//

import LinkKit
import UIKit

enum SampleLink: String, CaseIterable {

    case presentLink
    case navigationLink
    case tabAndNavigationLink
    case failureLink
}

extension SampleLink: Link {

    var body: some Link {
        switch self {
        case .presentLink:
            PresentLink(NamedViewController("A"))

        case .navigationLink:
            PresentLink(UINavigationController(rootViewController: NamedViewController("B")))
            PushLink([NamedViewController("C"), NamedViewController("D")])
            PopToRootLink()
            PushLink(NamedViewController("E"))
            PushLink(NamedViewController("F"))
            PushLink(NamedViewController("G"))

        case .tabAndNavigationLink:
            PresentLink(makeTabBarController())
            TabLink(index: 2)
            PushLink(NamedViewController("E"))

        case .failureLink:
            TabLink(index: 2)
        }
    }
}

private func makeTabBarController() -> UITabBarController {
    let tabBarController = UITabBarController()
    let tabC = UINavigationController(rootViewController: NamedViewController("TabC"))
    tabC.tabBarItem.title = "TabC"
    tabBarController.setViewControllers(
        [
            NamedViewController("TabA"),
            NamedViewController("TabB"),
            tabC,
        ],
        animated: false
    )
    return tabBarController
}
