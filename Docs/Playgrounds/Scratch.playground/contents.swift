
import UIKitSwagger
import XCPlayground


let container = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 540))
container.backgroundColor = LightGray
XCPShowView("Container View", container)


let alpha = UIView()
alpha.backgroundColor = Yellow

let bravo = UIView()
bravo.backgroundColor = Orange

let charlie = UIView()
charlie.backgroundColor = Red

let delta = UIView()
delta.backgroundColor = Purple

let echo = UIView()
echo.backgroundColor = Blue

let foxtrot = UIView()
foxtrot.backgroundColor = Green

let cards = [alpha, bravo, charlie, delta, echo, foxtrot]
container += cards

MatchSizes(cards)
AlignTop(container, alpha)
AlignBottom(foxtrot, container)
DistributeTopToBottom(cards)

let allViews = [container, alpha, bravo, charlie, delta, echo, foxtrot]
AlignLeading(allViews)
AlignTrailing(allViews)


