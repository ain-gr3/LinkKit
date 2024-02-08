//
//  Created by Ain on 2024/02/07.
//

import UIKit

@resultBuilder
public struct LinkBuilder {

    public static func buildBlock<each L: Link>(_ components: repeat each L) -> _SynchronousLink {
        var links: [any Link] = []
        repeat links.append(each components)
        return _SynchronousLink(value: links)
    }

    public static func buildOptional(_ component: (some Link)?) -> some Link {
        if let component {
            return AnyLink(component)
        } else {
            return AnyLink(EmptyLink())
        }
    }

    public static func buildEither<L: Link>(first component: L) -> L {
        component
    }

    public static func buildEither<L: Link>(second component: L) -> L {
        component
    }
}
