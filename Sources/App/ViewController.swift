public import UIKit

public class ViewController: UIViewController {
  override public func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}

public extension ViewController {
  static func make() -> Self {
    let storyboard = UIStoryboard(name: "ViewController", bundle: .module)
    return storyboard.instantiateInitialViewController() as! Self
  }
}
