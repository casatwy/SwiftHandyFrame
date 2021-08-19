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
        view.addSubview(containerView)
        containerView.addSubview(containerInnerItemView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        shapeView.hf.setSize(CGSize(width: 100, height: 100)).setLeft(20, shouldResize: false).setBottom(200, shouldResize: true).setTop(10, shouldResize: false)
        
        centerPositionWithOtherView.hf.setSize(CGSize(width: 50, height: 50)).setCenterEqualToView(shapeView)
        
        gapInOtherView.frame = centerPositionWithOtherView.frame
        gapInOtherView.hf.setInnerTopGap(200, shouldResize: false).setInnerBottomGap(200, shouldResize: true)
        
        gapFromOtherView.frame = gapInOtherView.frame
        gapFromOtherView.hf.setLeftGap(10, fromView: gapInOtherView)
        
        positionEqualOtherView.frame = gapFromOtherView.frame
        positionEqualOtherView.hf.setInnerTopGap(500, shouldResize: true).bottomEqualToView(gapFromOtherView).setLeftGap(10, fromView: gapFromOtherView)
        
        fillView.hf.setSize(CGSize(width: 20, height: 20)).fillWidth().setCenterYEqualToView(positionEqualOtherView)
        
        containerView.hf.setSize(CGSize(width: 100, height: 100)).setCenterEqualToView(view)

        containerInnerItemView.hf.setWidth(50).setCenterEqualToView(containerView).setInnerBottomGap(0, shouldResize: true)
    }
    
    lazy var containerView:UIView = {
        let _containerView = UIView()
        _containerView.backgroundColor = .black
        return _containerView
    }()
    
    lazy var containerInnerItemView:UIView = {
        let _containerInnerItemView = UIView()
        _containerInnerItemView.backgroundColor = .red
        return _containerInnerItemView
    }()
    
    lazy var shapeView : UIView = {
        let _shapeView = UIView()
        _shapeView.backgroundColor = .red
        return _shapeView
    }()
    
    lazy var centerPositionWithOtherView : UIView = {
        let _centerPositionWithOtherView = UIView()
        _centerPositionWithOtherView.backgroundColor = .green
        return _centerPositionWithOtherView
    }()
    
    lazy var gapInOtherView : UIView = {
        let _gapInOtherView = UIView()
        _gapInOtherView.backgroundColor = .cyan
        return _gapInOtherView
    }()
    
    lazy var gapFromOtherView : UIView = {
        let _gapFromOtherView = UIView()
        _gapFromOtherView.backgroundColor = .yellow
        return _gapFromOtherView
    }()
    
    lazy var positionEqualOtherView : UIView = {
        let _positionEqualOtherView = UIView()
        _positionEqualOtherView.backgroundColor = .magenta
        return _positionEqualOtherView
    }()
    
    lazy var fillView : UIView = {
        let _fillView = UIView()
        _fillView.backgroundColor = .orange
        return _fillView
    }()
}
