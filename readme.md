> pod "SwiftHandyFrame"

# 最佳实践

由于SwiftHandyFrame是基于frame的布局系统，所以在任何场景都可以直接修改view的布局。

但有些frame调整在计算布局的时候会依赖父view,所以为了保证能够使用完整的功能，第一次布局的时候应该在viewDidLoad的时候addSubview，在viewWillLayoutSubviews的时候使用SwiftHandyFrame进行布局。

以后修改布局就不受限制了。

```swift
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(shapeView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        shapeView.hf.setSize(CGSize(width: 100, height: 100))
        shapeView.hf.setLeft(20, shouldResize: false)
        shapeView.hf.setBottom(200, shouldResize: true)
        shapeView.hf.setTop(10, shouldResize: false)
    }
```

# view的尺寸

## 基础方法(width, height, size)
```swift

// 基础方法
let width = view.hf.width()
view.hf.setWidth(20)

let height = view.hf.height()
view.hf.setHeight(20)

let size = view.hf.size()
view.hf.setSize(CGSize(width: 10, height: 20))
```

## 修改宽度高度(width, height)

```swift
// 修改宽度高度
view.hf.addWidth(10, on: .left)
view.hf.addWidth(10, on: .right)

view.hf.addHeight(10, on: .top)
view.hf.addHeight(10, on: .bottom)
```

## 填满父view

```swift
view.hf.fillWidth() // 宽度填满父view
view.hf.fillHeight() // 高度填满父view
view.hf.fill() // 宽度和高度都填满父view
```

# shouldResize的意义

shouldResize是指在设置值的时候，是否要改变view的尺寸。

假设某个view的left为100，width为100：

```

left=100
width=100

-----------------------------------------------------
|                                                   |
|                  --------width:100------          |
|                  |                     |          |
|                  |                     |          |
|                  |                     |          |
|              left:100                  |          |
|                  |                     |          |
|                  |                     |          |
|                  |                     |          |
|                  |                     |          |
|                  -----------------------          |
|                                                   |
-----------------------------------------------------
```

当我们设置left为10，shouldResize为false的时候，相当于把这个view往左挪到了left为10的地方：

```

left=10
width=100
shouldResize=false

-----------------------------------------------------
|                                                   |
|       --------width:100------                     |
|       |                     |                     |
|       |                     |                     |
|       |                     |                     |
|   left:10                   |                     |
|       |                     |                     |
|       |                     |                     |
|       |                     |                     |
|       |                     |                     |
|       -----------------------                     |
|                                                   |
-----------------------------------------------------
```

当我们设置left为10，shouldResize为true的时候，相当于把这个view延展到了left为10的地方：

```

left=10
width=190
shouldResize=true

-----------------------------------------------------
|                                                   |
|       -------------width:190------------          |
|       |                                |          |
|       |                                |          |
|       |                                |          |
|       |                                |          |
|   left:10                              |          |
|       |                                |          |
|       |                                |          |
|       |                                |          |
|       |                                |          |
|       ----------------------------------          |
|                                                   |
-----------------------------------------------------
```

# view的位置

## 基础方法(x, y, center, centerX, centerY)

```swift
let x = view.hf.x()
view.hf.setX(10)

let y = view.hf.y()
view.hf.setY(10)

let center = view.hf.center()
view.hf.setCenter(CGPoint(x: 10, y: 10))

let centerX = view.hf.centerX()
view.hf.setCenterX(10)

let centerY = view.hf.centerY()
view.hf.setCenterY(10)
```

## Center与其它View的Center相等

```swift

// otherView为UIView

view.hf.setCenterEqualToView(otherView)
view.hf.setCenterXEqualToView(otherView)
view.hf.setCenterYEqualToView(otherView)
```

## 根据View的left,right,top, bottom调整位置

```swift
let left = view.hf.left()
view.hf.setLeft(10, shouldResize:true)

let right = view.hf.right()
view.hf.setRight(10, shouldResize:true)

let bottom = view.hf.bottom()
view.hf.setBottom(10, shouldResize:false)

let top = view.hf.top()
view.hf.setTop(10, shouldResize:false)
```

## 使View的left,right,top,bottom等于另一个View

```swift
view.hf.topEqualToView(otherView)
view.hf.bottomEqualToView(otherView)
view.hf.leftEqualToView(otherView)
view.hf.rightEqualToView(otherView)
```

## 让view的left,right,top,bottom相对于自己的父view做配置

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

```swift
view.hf.setInnerTopGap(10, shouldResize:true)
view.hf.setInnerBottomGap(10, shouldResize:true)
view.hf.setInnerLeftGap(10, shouldResize:false)
view.hf.setInnerRightGap(10, shouldResize:false)
```

## 让view的left,right,top,bottom相对于其它不是父view的view做配置

```
                |                   |
                |        view       |
                ---------------------
                        top gap
   ---          ---------------------           ---
     |          |                   |           |
     |          |                   |           |
     |          |                   |           |
view | left gap |        VIEW       | right gap | view
     |          |                   |           |
     |          |                   |           |
     |          |                   |           |
   ---          ---------------------           ---
                      bottom gap
                ---------------------
                |        view       |
                |                   |
```

```swift
// otherView是UIView
view.hf.setTopGap(10, fromView:otherView)
view.hf.setBottomGap(10, fromView:otherView)
view.hf.setLeftGap(10, fromView:otherView)
view.hf.setRightGap(10, fromView:otherView)
```
