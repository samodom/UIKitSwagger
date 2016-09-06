import UIKitSwagger
import XCPlayground


public class CircleView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    private func setupConstraints() {
        setTranslatesAutoresizingMaskIntoConstraints(false)
        constrainWidthToHeight()
    }

    override public class func requiresConstraintBasedLayout() -> Bool {
        return true
    }

}

let frame = CGRect(x: 0, y: 0, width: 320, height: 640)
let containerView = UIView(frame: frame)

let blueSquare = UIView()
blueSquare.backgroundColor = Blue
blueSquare.constrainWidthToHeight()

let greenSquare = UIView()
greenSquare.backgroundColor = Green
greenSquare.constrainWidthToHeight()

let orangeCircle = CircleView()
orangeCircle.backgroundColor = Orange
orangeCircle.constrainWidthToHeight()

DoNotTranslateMasks(blueSquare, greenSquare, orangeCircle)
containerView += [blueSquare, greenSquare, orangeCircle]

MatchWidths(blueSquare, greenSquare, orangeCircle)
AlignHorizontally(containerView, blueSquare, greenSquare, orangeCircle)
DistributeTopToBottom(spacing: 15, blueSquare, greenSquare, orangeCircle)
AlignTop(containerView, blueSquare)
AlignBottom(containerView, orangeCircle)

XCPShowView("Container View", containerView)


