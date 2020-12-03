# XAxis

``` swift
@objc(ChartXAxis) open class XAxis: AxisBase
```

## Inheritance

[`AxisBase`](/AxisBase)

## Initializers

### `init()`

``` swift
public override init()
```

## Properties

### `labelWidth`

width of the x-axis labels in pixels - this is automatically calculated by the `computeSize()` methods in the renderers

``` swift
var labelWidth
```

### `labelHeight`

height of the x-axis labels in pixels - this is automatically calculated by the `computeSize()` methods in the renderers

``` swift
var labelHeight
```

### `labelRotatedWidth`

width of the (rotated) x-axis labels in pixels - this is automatically calculated by the `computeSize()` methods in the renderers

``` swift
var labelRotatedWidth
```

### `labelRotatedHeight`

height of the (rotated) x-axis labels in pixels - this is automatically calculated by the `computeSize()` methods in the renderers

``` swift
var labelRotatedHeight
```

### `labelRotationAngle`

This is the angle for drawing the X axis labels (in degrees)

``` swift
var labelRotationAngle
```

### `avoidFirstLastClippingEnabled`

if set to true, the chart will avoid that the first and last label entry in the chart "clip" off the edge of the chart

``` swift
var avoidFirstLastClippingEnabled = false
```

### `labelPosition`

the position of the x-labels relative to the chart

``` swift
var labelPosition = LabelPosition.top
```

### `wordWrapEnabled`

if set to true, word wrapping the labels will be enabled.
word wrapping is done using `(value width * labelRotatedWidth)`

``` swift
var wordWrapEnabled = false
```

> 

### `isWordWrapEnabled`

`true` if word wrapping the labels is enabled

``` swift
var isWordWrapEnabled: Bool
```

### `wordWrapWidthPercent`

the width for wrapping the labels, as percentage out of one value width.
used only when isWordWrapEnabled = true.

``` swift
var wordWrapWidthPercent: CGFloat = 1.0
```

**default**: 1.0

### `isAvoidFirstLastClippingEnabled`

``` swift
var isAvoidFirstLastClippingEnabled: Bool
```
