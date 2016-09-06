import UIKitSwagger
import XCPlayground


let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let containerView = UIView(frame: frame)
containerView.backgroundColor = Orange

let toggle = UISwitch()
toggle.backgroundColor = Yellow
toggle.tintColor = Blue
containerView += toggle

DoNotTranslateMasks(toggle)
AlignCenters(containerView, toggle)

XCPShowView("Switch", containerView)

UIView.animateWithDuration(2) {
    toggle.toggle()
}
