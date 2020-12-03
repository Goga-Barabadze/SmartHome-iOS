# YAxisRenderer

``` swift
@objc(ChartYAxisRenderer) open class YAxisRenderer: AxisRendererBase
```

## Inheritance

[`AxisRendererBase`](/AxisRendererBase)

## Initializers

### `init(viewPortHandler:yAxis:transformer:)`

``` swift
@objc public init(viewPortHandler: ViewPortHandler, yAxis: YAxis?, transformer: Transformer?)
```

## Properties

### `gridClippingRect`

``` swift
var gridClippingRect: CGRect
```

## Methods

### `renderAxisLabels(context:)`

draws the y-axis labels to the screen

``` swift
open override func renderAxisLabels(context: CGContext)
```

### `renderAxisLine(context:)`

``` swift
open override func renderAxisLine(context: CGContext)
```

### `drawYLabels(context:fixedPosition:positions:offset:textAlign:)`

draws the y-labels on the specified x-position

``` swift
open func drawYLabels(context: CGContext, fixedPosition: CGFloat, positions: [CGPoint], offset: CGFloat, textAlign: NSTextAlignment)
```

### `renderGridLines(context:)`

``` swift
open override func renderGridLines(context: CGContext)
```

### `drawGridLine(context:position:)`

``` swift
@objc open func drawGridLine(context: CGContext, position: CGPoint)
```

### `transformedPositions()`

``` swift
@objc open func transformedPositions() -> [CGPoint]
```

### `drawZeroLine(context:)`

Draws the zero line at the specified position.

``` swift
@objc open func drawZeroLine(context: CGContext)
```

### `renderLimitLines(context:)`

``` swift
open override func renderLimitLines(context: CGContext)
```
