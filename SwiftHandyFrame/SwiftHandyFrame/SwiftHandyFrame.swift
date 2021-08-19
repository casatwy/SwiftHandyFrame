//
//  HandyFrame.swift
//  Leetcode_swift
//
//  Created by casa on 2018/8/17.
//  Copyright © 2018年 casa. All rights reserved.
//

import UIKit

public class HandyFrameView {
    private let targetView:UIView

    public lazy var safeAreaBottomGap:CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            if superview.safeAreaLayoutGuide.layoutFrame.size.height > 0 {
                return superview.frame.size.height - superview.safeAreaLayoutGuide.layoutFrame.origin.y - superview.safeAreaLayoutGuide.layoutFrame.size.height
            } else {
                return 0
            }
        } else {
            return 0
        }
    }()

    public lazy var safeAreaTopGap:CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.y
        } else {
            return 0
        }
    }()

    public lazy var safeAreaLeftGap:CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.x
        } else {
            return 0
        }
    }()

    public lazy var safeAreaRightGap:CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.x
        } else {
            return 0
        }
    }()

    init(_ targetView:UIView) {
        self.targetView = targetView
    }
}

public protocol HandyFrameExtended {
    var hf: HandyFrameView { get }
}

public extension HandyFrameExtended {
    var hf: HandyFrameView {
        get {
            return HandyFrameView(self as! UIView)
        }
    }
}

extension UIView: HandyFrameExtended {}

// MARK: Size: width, height, size
public extension HandyFrameView {
    func width() -> CGFloat {
        return targetView.frame.size.width
    }

    @discardableResult
    func setWidth(_ width:CGFloat) -> HandyFrameView {
        targetView.frame.size.width = width
        return self
    }

    func height() -> CGFloat {
        return targetView.frame.size.height
    }

    @discardableResult
    func setHeight(_ height:CGFloat) -> HandyFrameView {
        targetView.frame.size.height = height
        return self
    }

    func size() -> CGSize {
        return targetView.frame.size
    }

    @discardableResult
    func setSize(_ size:CGSize) -> HandyFrameView {
        targetView.frame.size = size
        return self
    }
}

// MARK: add width or height
public extension HandyFrameView {
    enum HorizontalSide {
        case left,right
    }
    enum VerticalSide {
        case top,bottom
    }
    
    @discardableResult
    func addWidth(_ widthToAdd:CGFloat, on side:HorizontalSide) -> HandyFrameView {
        switch side {
        case .left:
            targetView.frame.size.width += widthToAdd
            targetView.frame.origin.x -= widthToAdd
        case .right:
            targetView.frame.size.width += widthToAdd
        }
        return self
    }

    @discardableResult
    func addHeight(_ heightToAdd:CGFloat, on side:VerticalSide) -> HandyFrameView {
        switch side {
        case .top:
            targetView.frame.size.height += heightToAdd
            targetView.frame.origin.y -= heightToAdd
        case .bottom:
            targetView.frame.size.height += heightToAdd
        }
        return self
    }
}

// MARK: Position: x, y, centerX, centerY, center
public extension HandyFrameView {
    func x() -> CGFloat {
        return targetView.frame.origin.x
    }

    @discardableResult
    func setX(_ x:CGFloat) -> HandyFrameView {
        targetView.frame.origin.x = x
        return self
    }

    func y() -> CGFloat {
        return targetView.frame.origin.y
    }

    @discardableResult
    func setY(_ y:CGFloat) -> HandyFrameView {
        targetView.frame.origin.y = y
        return self
    }

    func centerX() -> CGFloat {
        return targetView.center.x
    }

    @discardableResult
    func setCenterX(_ centerX:CGFloat) -> HandyFrameView {
        targetView.center.x = centerX
        return self
    }

    func centerY() -> CGFloat {
        return targetView.center.y
    }

    @discardableResult
    func setCenterY(_ centerY:CGFloat) -> HandyFrameView {
        targetView.center.y = centerY
        return self
    }

    func center() -> CGPoint {
        return targetView.center
    }

    @discardableResult
    func setCenter(_ center:CGPoint) -> HandyFrameView {
        targetView.center = center
        return self
    }
}

// MARK: Center related to other view
public extension HandyFrameView {
    @discardableResult
    func setCenterXEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchTopView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenterX(centerPoint.x)
    }

    @discardableResult
    func setCenterYEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchTopView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenterY(centerPoint.y)
    }

    @discardableResult
    func setCenterEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchTopView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenter(centerPoint)
    }
}

// MARK: Positon: left, right, top, bottom
public extension HandyFrameView {
    func left() -> CGFloat {
        return targetView.frame.origin.x
    }

    @discardableResult
    func setLeft(_ left:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.width = targetView.frame.origin.x - left + targetView.frame.size.width
        }
        targetView.frame.origin.x = left
        return self
    }

    func right() -> CGFloat {
        return targetView.frame.origin.x + targetView.frame.size.width
    }

    @discardableResult
    func setRight(_ right:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.width = right - targetView.frame.origin.x
        } else {
            targetView.frame.origin.x = right - targetView.frame.size.width
        }
        return self
    }

    func bottom() -> CGFloat {
        return targetView.frame.origin.y + targetView.frame.size.height
    }

    @discardableResult
    func setBottom(_ bottom:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.height = bottom - targetView.frame.origin.y
        } else {
            targetView.frame.origin.y = bottom - targetView.frame.size.height
        }
        return self
    }

    func top() -> CGFloat {
        return targetView.frame.origin.y
    }

    @discardableResult
    func setTop(_ top:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.height = targetView.frame.size.height - top + targetView.frame.origin.y
        }
        targetView.frame.origin.y = top
        return self
    }
}

// MARK: Position equal to view
public extension HandyFrameView {
    @discardableResult
    func topEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchTopView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        targetView.frame.origin.y = newOriginPoint.y
        return self
    }

    @discardableResult
    func bottomEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchTopView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        targetView.frame.origin.y = newOriginPoint.y + view.frame.size.height - targetView.frame.size.height
        return self
    }

    @discardableResult
    func leftEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }

        let viewSuperView = view.superview ?? view
        let topSuperView = fetchTopView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        targetView.frame.origin.x = newOriginPoint.x
        return self
    }

    @discardableResult
    func rightEqualToView(_ view:UIView?) -> HandyFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchTopView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        targetView.frame.origin.x = newOriginPoint.x + view.frame.size.width - targetView.frame.size.width
        return self
    }
}

// MARK: inner gap with superview
/*
        ---------------------------------------------
        | superview          top                    |
        |                    gap                    |
        |          ----------------------           |
        |          |                    |           |
        |          |                    |           |
        |          |                    |           |
        |   left   |        VIEW        |   right   |
        |   gap    |                    |    gap    |
        |          |                    |           |
        |          |                    |           |
        |          ----------------------           |
        |                  bottom                   |
        |                    gap                    |
        ---------------------------------------------
 */
public extension HandyFrameView {
    @discardableResult
    func setInnerTopGap(_ topGap:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.height = targetView.frame.origin.y - topGap + targetView.frame.size.height
        }
        targetView.frame.origin.y = topGap
        return self
    }

    @discardableResult
    func setInnerBottomGap(_ bottomGap:CGFloat, shouldResize:Bool) -> HandyFrameView {
        guard let superview = targetView.superview else { return self }
        if shouldResize {
            targetView.frame.size.height = superview.frame.size.height - bottomGap - targetView.frame.origin.y - safeAreaBottomGap
        } else {
            targetView.frame.origin.y = superview.frame.size.height - targetView.frame.size.height - bottomGap - safeAreaBottomGap
        }
        return self
    }

    @discardableResult
    func setInnerLeftGap(_ leftGap:CGFloat, shouldResize:Bool) -> HandyFrameView {
        if shouldResize {
            targetView.frame.size.width = targetView.frame.origin.x - leftGap + targetView.frame.size.width
        }
        targetView.frame.origin.x = leftGap
        return self
    }

    @discardableResult
    func setInnerRightGap(_ rightGap:CGFloat, shouldResize:Bool) -> HandyFrameView {
        guard let superview = targetView.superview else { return self }
        if shouldResize {
            targetView.frame.size.width = superview.frame.size.width - rightGap - targetView.frame.origin.x
        } else {
            targetView.frame.origin.x = superview.frame.size.width - targetView.frame.size.width - rightGap
        }
        return self
    }
}

// MARK: gap with other view
/*
               |                   |
               |                   |
               ---------------------
                      top gap
  ---          ---------------------           ---
    |          |                   |           |
    |          |                   |           |
    |          |                   |           |
    | left gap |        VIEW       | right gap |
    |          |                   |           |
    |          |                   |           |
    |          |                   |           |
  ---          ---------------------           ---
                    bottom gap
               ---------------------
               |                   |
               |                   |
 */
public extension HandyFrameView {
    @discardableResult
    func setTopGap(_ topGap:CGFloat, fromView:UIView?) -> HandyFrameView {
        guard let fromView = fromView else { return self }
        
        let fromViewSuperView = fromView.superview ?? fromView
        let topView = fetchTopView()
        let viewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to: topView)
        let newOriginPoint = topView.convert(viewOriginPoint, to:targetView.superview)
        targetView.frame.origin.y = newOriginPoint.y + topGap + fromView.frame.size.height
        return self
    }

    @discardableResult
    func setBottomGap(_ bottomGap:CGFloat, fromView:UIView?) -> HandyFrameView {
        guard let fromView = fromView else { return self }
        
        let fromViewSuperView = fromView.superview ?? fromView
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:targetView.superview)
        targetView.frame.origin.y = fromViewOriginPoint.y - bottomGap - targetView.frame.size.height
        return self
    }

    @discardableResult
    func setLeftGap(_ leftGap:CGFloat, fromView:UIView?) -> HandyFrameView {
        guard let fromView = fromView else { return self }
        
        let fromViewSuperView = fromView.superview ?? fromView
        let topView = fetchTopView()
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:topView)
        let newOriginPoint = topView.convert(fromViewOriginPoint, to: targetView.superview)
        targetView.frame.origin.x = newOriginPoint.x + leftGap + fromView.frame.size.width
        return self
    }

    @discardableResult
    func setRightGap(_ rightGap:CGFloat, fromView:UIView?) -> HandyFrameView {
        guard let fromView = fromView else { return self }
        
        let fromViewSuperView = fromView.superview ?? fromView
        let topView = fetchTopView()
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:topView)
        let newOriginPoint = topView.convert(fromViewOriginPoint, to: targetView.superview)
        targetView.frame.origin.x = newOriginPoint.x - rightGap - fromView.frame.size.width
        return self
    }
}

// MARK: Fill
public extension HandyFrameView {
    @discardableResult
    func fillWidth() -> HandyFrameView {
        guard let superview = targetView.superview else { return self }
        targetView.frame.size.width = superview.frame.size.width
        targetView.frame.origin.x = 0
        return self
    }

    @discardableResult
    func fillHeight() -> HandyFrameView {
        guard let superview = targetView.superview else { return self }
        targetView.frame.size.height = superview.frame.size.height
        targetView.frame.origin.y = 0
        return self
    }

    @discardableResult
    func fill() -> HandyFrameView {
        guard let superview = targetView.superview else { return self }
        let height = superview.frame.size.height - safeAreaBottomGap
        targetView.frame = CGRect(x: 0, y: 0, width: superview.frame.size.width, height: height)
        return self
    }
}

// MARK: helper methods
public extension HandyFrameView {
    func fetchTopView() -> UIView {
        var result = targetView

        while result.superview != nil {
            result = result.superview ?? result
        }

        return result
    }
}
