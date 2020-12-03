# MarkerImage

``` swift
@objc(ChartMarkerImage) open class MarkerImage: NSObject, IMarker
```

## Inheritance

[`IMarker`](/IMarker), `NSObject`

## Initializers

### `init()`

``` swift
public override init()
```

## Properties

### `image`

The marker image to render

``` swift
var image: NSUIImage?
```

### `offset`

``` swift
var offset: CGPoint
```

### `chartView`

``` swift
var chartView: ChartViewBase?
```

### `size`

As long as size is 0.0/0.0 - it will default to the image's size

``` swift
var size: CGSize
```

## Methods

### `offsetForDrawing(atPoint:)`

``` swift
open func offsetForDrawing(atPoint point: CGPoint) -> CGPoint
```

### `refreshContent(entry:highlight:)`

``` swift
open func refreshContent(entry: ChartDataEntry, highlight: Highlight)
```

### `draw(context:point:)`

``` swift
open func draw(context: CGContext, point: CGPoint)
```
