//
//  HandyFrame.swift
//  Leetcode_swift
//
//  Created by casa on 2018/8/17.
//  Copyright © 2018年 casa. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: class method
    public class func ct_ScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    public class func ct_ScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    public class func ct_ScreenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    //MARK: Size
    public func ct_height() -> CGFloat {
        return frame.size.height
    }
    
    public func ct_setHeight(_ height:CGFloat) {
        frame.size.height = height
    }
    
    public func ct_width() -> CGFloat {
        return frame.size.width
    }
    
    public func ct_setWidth(_ width:CGFloat) {
        frame.size.width = width
    }
    
    public func ct_size() -> CGSize {
        return frame.size
    }
    
    public func ct_setSize(_ size:CGSize) {
        frame.size = size
    }
    
    //MARK: Position
    public func ct_x() -> CGFloat {
        return frame.origin.x
    }
    
    public func ct_setX(_ x:CGFloat) {
        frame.origin.x = x
    }
    
    public func ct_y() -> CGFloat {
        return frame.origin.y
    }
    
    public func ct_setY(_ y:CGFloat) {
        frame.origin.y = y
    }
    
    public func ct_centerX() -> CGFloat {
        return center.x
    }
    
    public func ct_setCenterX(_ centerX:CGFloat) {
        center.x = centerX
    }
    
    public func ct_centerY() -> CGFloat {
        return center.y
    }
    
    public func ct_setCenterY(_ centerY:CGFloat) {
        center.y = centerY
    }
    
    //MARK: Shape
    public func ct_left() -> CGFloat {
        return frame.origin.x
    }
    
    public func ct_setLeft(_ left:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.width = frame.origin.x - left + frame.size.width
        }
        frame.origin.x = left
    }
    
    public func ct_right() -> CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    public func ct_setRight(_ right:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.width = right - frame.origin.x
        } else {
            frame.origin.x = right - frame.size.width
        }
    }
    
    public func ct_bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public func ct_setBottom(_ bottom:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.height = bottom - frame.origin.y
        } else {
            frame.origin.y = bottom - frame.size.height
        }
    }
    
    public func ct_top() -> CGFloat {
        return frame.origin.y
    }
    
    public func ct_setTop(_ top:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.height = frame.size.height - top + frame.origin.y
        }
        frame.origin.y = top
    }
    
    //MARK: Center Position with Other View
    public func ct_setCenterXEqualToView(_ view:UIView) {
        let superView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        
        let viewCenterPoint = superView.convert(view.center, to:topSuperView)
        let centerPoint = topSuperView.convert(viewCenterPoint, to:superview)
        ct_setCenterX(centerPoint.x)
    }
    
    public func ct_setCenterYEqualToView(_ view:UIView) {
        let superView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        
        let viewCenterPoint = superView.convert(view.center, to:topSuperView)
        let centerPoint = topSuperView.convert(viewCenterPoint, to:superview)
        ct_setCenterY(centerPoint.y)
    }
    
    public func ct_setCenterEqualToView(_ view:UIView) {
        let superView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        
        let viewCenterPoint = superView.convert(view.center, to:topSuperView)
        let centerPoint = topSuperView.convert(viewCenterPoint, to:superview)
        center = centerPoint
    }
    
    //MARK: top/bottom/left/right gap in Other View
    
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
    
    
    public func ct_setInnerTopGap(_ topGap:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.height = frame.origin.y - topGap + frame.size.height
        }
        frame.origin.y = topGap
    }
    
    public func ct_setInnerBottomGap(_ bottomGap:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.height = superview!.frame.size.height - bottomGap - frame.origin.y - ct_safeAreaBottomGap()
        } else {
            frame.origin.y = superview!.frame.size.height - frame.size.height - bottomGap - ct_safeAreaBottomGap()
        }
    }
    
    public func ct_setInnerLeftGap(_ leftGap:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.width = frame.origin.x - leftGap + frame.size.width
        }
        frame.origin.x = leftGap
    }
    
    public func ct_setInnerRightGap(_ rightGap:CGFloat, shouldResize:Bool) {
        if shouldResize {
            frame.size.width = superview!.frame.size.width - rightGap - frame.origin.x
        } else {
            frame.origin.x = superview!.frame.size.width - frame.size.width - rightGap
        }
    }
    
    //MARK: top/bottom/left/right gap from Other View
    /*
     
                   |                   |
                   |                   |
                   ---------------------
                          top gap
     ---           ---------------------           ---
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
    public func ct_setTopGap(_ topGap:CGFloat, fromView:UIView) {
        let fromViewSuperView = fromView.superview ?? fromView
        let topSuperView = ct_topSuperView()
        let viewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to: topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to:superview)
        frame.origin.y = newOriginPoint.y + topGap + fromView.frame.size.height
    }
    
    public func ct_setBottomGap(_ bottomGap:CGFloat, fromView:UIView) {
        let fromViewSuperView = fromView.superview ?? fromView
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:superview)
        frame.origin.y = fromViewOriginPoint.y - bottomGap - frame.size.height
    }
    
    public func ct_setLeftGap(_ leftGap:CGFloat, fromView:UIView) {
        let fromViewSuperView = fromView.superview ?? fromView
        let topSuperView = ct_topSuperView()
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(fromViewOriginPoint, to: superview)
        frame.origin.x = newOriginPoint.x + leftGap + fromView.frame.size.width
    }
    
    public func ct_setRightGap(_ rightGap:CGFloat, fromView:UIView) {
        let fromViewSuperView = fromView.superview ?? fromView
        let topSuperView = ct_topSuperView()
        let fromViewOriginPoint = fromViewSuperView.convert(fromView.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(fromViewOriginPoint, to: superview)
        frame.origin.x = newOriginPoint.x - rightGap - fromView.frame.size.width
    }
    
    //MARK: top/bottom/left/right equal to Other View
    public func ct_topEqualToView(_ view:UIView) {
        let viewSuperView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: superview)
        frame.origin.y = newOriginPoint.y
    }
    
    public func ct_bottomEqualToView(_ view:UIView) {
        let viewSuperView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: superview)
        frame.origin.y = newOriginPoint.y + view.frame.size.height - frame.size.height
    }
    
    public func ct_leftEqualToView(_ view:UIView) {
        let viewSuperView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: superview)
        frame.origin.x = newOriginPoint.x
    }
    
    public func ct_rightEqualToView(_ view:UIView) {
        let viewSuperView = view.superview ?? view
        let topSuperView = ct_topSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: superview)
        frame.origin.x = newOriginPoint.x + view.frame.size.width - frame.size.width
    }
    
    //MARK: Fill
    public func ct_fillWidth() {
        frame.size.width = superview!.frame.size.width
        frame.origin.x = 0
    }
    
    public func ct_fillHeight() {
        frame.size.height = superview!.frame.size.height
        frame.origin.y = 0
    }
    
    public func ct_fill() {
        frame = CGRect(x: 0, y: 0, width: superview!.frame.size.width, height: superview!.frame.size.height)
    }

    //MARK: helper method
    private func ct_topSuperView() -> UIView {
        var topSuperView = superview
        if topSuperView == nil {
            topSuperView = self
        } else {
            while topSuperView!.superview != nil {
                topSuperView = topSuperView!.superview
            }
        }
        
        return topSuperView!
    }
    
    private func ct_safeAreaBottomGap() -> CGFloat {
        if #available(iOS 11.0, *) {
            if superview!.safeAreaLayoutGuide.layoutFrame.size.height > 0 {
                return superview!.frame.size.height - superview!.safeAreaLayoutGuide.layoutFrame.origin.y - superview!.safeAreaLayoutGuide.layoutFrame.size.height;
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
