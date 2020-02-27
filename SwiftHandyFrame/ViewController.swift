//
//  ViewController.swift
//  SwiftHandyFrame
//
//  Created by casa on 2018/8/21.
//  Copyright © 2018年 casa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(shapeView)
        view.addSubview(centerPositionWithOtherView)
        view.addSubview(gapInOtherView)
        view.addSubview(gapFromOtherView)
        view.addSubview(positionEqualOtherView)
        view.addSubview(fillView)
    }

    override func viewWillLayoutSubviews() {
        shapeView.hf.setSize(CGSize(width: 100, height: 100))
        shapeView.hf.setLeft(20, shouldResize: false)
        shapeView.hf.setBottom(200, shouldResize: true)
        shapeView.hf.setTop(10, shouldResize: false)
        
        centerPositionWithOtherView.hf.setSize(CGSize(width: 50, height: 50))
        centerPositionWithOtherView.hf.setCenterEqualToView(shapeView)
        
        gapInOtherView.frame = centerPositionWithOtherView.frame
        gapInOtherView.hf.setInnerTopGap(200, shouldResize: false)
        gapInOtherView.hf.setInnerBottomGap(200, shouldResize: true)
        
        gapFromOtherView.frame = gapInOtherView.frame
        gapFromOtherView.hf.setLeftGap(10, fromView: gapInOtherView)
        
        positionEqualOtherView.frame = gapFromOtherView.frame
        positionEqualOtherView.hf.setInnerTopGap(500, shouldResize: true)
        positionEqualOtherView.hf.bottomEqualToView(gapFromOtherView)
        positionEqualOtherView.hf.setLeftGap(10, fromView: gapFromOtherView)
        
        fillView.hf.setSize(CGSize(width: 20, height: 20))
        fillView.hf.fillWidth()
        fillView.hf.setCenterYEqualToView(positionEqualOtherView)
    }

    let _shapeView = UIView()
    var shapeView : UIView {
        get {
            if _shapeView.backgroundColor == nil {
                _shapeView.backgroundColor = .red
            }
            return _shapeView
        }
    }

    let _centerPositionWithOtherView = UIView()
    var centerPositionWithOtherView : UIView {
        get {
            if _centerPositionWithOtherView.backgroundColor == nil {
                _centerPositionWithOtherView.backgroundColor = .green
            }
            return _centerPositionWithOtherView
        }
    }

    let _gapInOtherView = UIView()
    var gapInOtherView : UIView {
        get {
            if _gapInOtherView.backgroundColor == nil {
                _gapInOtherView.backgroundColor = .cyan
            }
            return _gapInOtherView
        }
    }

    let _gapFromOtherView = UIView()
    var gapFromOtherView : UIView {
        get {
            if _gapFromOtherView.backgroundColor == nil {
                _gapFromOtherView.backgroundColor = .yellow
            }
            return _gapFromOtherView
        }
    }

    let _positionEqualOtherView = UIView()
    var positionEqualOtherView : UIView {
        get {
            if _positionEqualOtherView.backgroundColor == nil {
                _positionEqualOtherView.backgroundColor = .magenta
            }
            return _positionEqualOtherView
        }
    }

    let _fillView = UIView()
    var fillView : UIView {
        get {
            if _fillView.backgroundColor == nil {
                _fillView.backgroundColor = .orange
            }
            return _fillView
        }
    }
}
