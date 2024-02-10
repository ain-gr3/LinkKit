//
//  Created by Ain Obara on 2024/02/08.
//

import UIKit

final class NamedViewController: UIViewController {

    let name: String

    init(_ name: String) {
        self.name = name

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = name
        tabBarItem.title = name

        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = name

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
