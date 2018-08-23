pod "SwiftHandyFrame"

`shouldResize` means wether to extend the view to match the value you gave to left/right/bottom/top

say we have a view, origin frame is (0, 0, 100, 100):

```
-----------------------------------------------------
|------------------------                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
||                      |                           |
|------------------------                           |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
-----------------------------------------------------
```

if we use `exampleView.ct_setRight(100, shouldResize:false)` on it, make `shouldResize` false, it will be look like this:

```
-----------------------------------------------------
|                      ------------------------     |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      |                      | 100 |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      |                      |     |
|                      ------------------------     |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
-----------------------------------------------------
```

if we use `exampleView.ct_setRight(100, shouldResize:true)` on it, make `shouldResize` true, it will be look like this:

```
-----------------------------------------------------
|----------------------------------------------     |
||                                            |     |
||                                            |     |
||                                            |     |
||                                            |     |
||                                            |     |
||                                            | 100 |
||                                            |     |
||                                            |     |
||                                            |     |
||                                            |     |
||                                            |     |
|----------------------------------------------     |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
|                                                   |
-----------------------------------------------------
```
> Position & Size

```
    public func ct_left() -> CGFloat
    public func ct_setLeft(_ left:CGFloat, shouldResize:Bool)

    public func ct_right() -> CGFloat
    public func ct_setRight(_ right:CGFloat, shouldResize:Bool)

    public func ct_bottom() -> CGFloat
    public func ct_setBottom(_ bottom:CGFloat, shouldResize:Bool)

    public func ct_top() -> CGFloat
    public func ct_setTop(_ top:CGFloat, shouldResize:Bool)

    ------------------

    public func ct_height() -> CGFloat
    public func ct_setHeight(_ height:CGFloat)

    public func ct_width() -> CGFloat
    public func ct_setWidth(_ width:CGFloat)

    public func ct_size() -> CGSize
    public func ct_setSize(_ size:CGSize)

    ------------------

    public func ct_x() -> CGFloat
    public func ct_setX(_ x:CGFloat)

    public func ct_y() -> CGFloat
    public func ct_setY(_ y:CGFloat)

    public func ct_centerX() -> CGFloat
    public func ct_setCenterX(_ centerX:CGFloat)

    public func ct_centerY() -> CGFloat
    public func ct_setCenterY(_ centerY:CGFloat)
```

> Center Postion With Other View

```
    public func ct_setCenterXEqualToView(_ view:UIView)

    public func ct_setCenterYEqualToView(_ view:UIView)

    public func ct_setCenterEqualToView(_ view:UIView)
```

> Set Inner Gap

```
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
```

```
    public func ct_setInnerTopGap(_ topGap:CGFloat, shouldResize:Bool)

    public func ct_setInnerBottomGap(_ bottomGap:CGFloat, shouldResize:Bool)

    public func ct_setInnerLeftGap(_ leftGap:CGFloat, shouldResize:Bool)

    public func ct_setInnerRightGap(_ rightGap:CGFloat, shouldResize:Bool)
```

> Set Gap From Other View

```
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
```

```
    public func ct_setTopGap(_ topGap:CGFloat, fromView:UIView)

    public func ct_setBottomGap(_ bottomGap:CGFloat, fromView:UIView)

    public func ct_setLeftGap(_ leftGap:CGFloat, fromView:UIView)

    public func ct_setRightGap(_ rightGap:CGFloat, fromView:UIView)
```

> top/bottom/left/right equal to Other View

```
    public func ct_topEqualToView(_ view:UIView)
    
    public func ct_bottomEqualToView(_ view:UIView)
    
    public func ct_leftEqualToView(_ view:UIView)
    
    public func ct_rightEqualToView(_ view:UIView)

```

> Fill Super View

```
    public func ct_fillWidth()

    public func ct_fillHeight()

    public func ct_fill()
```
