//
//  Created by Ain on 2024/02/07.
//

import UIKit

@resultBuilder
public struct LinkBuilder {

    @inlinable
    public static func buildBlock<each L: Link>(_ components: repeat each L) -> _SynchronousLink {
        var links: [any Link] = []
        repeat links.append(each components)
        return _SynchronousLink(value: links)
    }

    @inlinable
    public static func buildBlock() -> EmptyLink {
        EmptyLink()
    }

    @inlinable
    public static func buildOptional<L: Link>(_ component: L?) -> AnyLink {
        if let component {
            return AnyLink(component)
        } else {
            return AnyLink(EmptyLink())
        }
    }

    @inlinable
    public static func buildEither<L: Link>(first component: L) -> L {
        component
    }

    @inlinable
    public static func buildEither<L: Link>(second component: L) -> L {
        component
    }
}
