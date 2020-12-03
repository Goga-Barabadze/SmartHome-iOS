# ChartLimitLine

The limit line is an additional feature for all Line, Bar and ScatterCharts.
It allows the displaying of an additional line in the chart that marks a certain maximum / limit on the specified axis (x- or y-axis).

``` swift
open class ChartLimitLine: ComponentBase
```

## Inheritance

[`ComponentBase`](/ComponentBase)

## Initializers

### `init()`

``` swift
public override init()
```

### `init(limit:)`

``` swift
@objc public init(limit: Double)
```

### `init(limit:label:)`

``` swift
@objc public init(limit: Double, label: String)
```

## Properties

### `limit`

limit / maximum (the y-value or xIndex)

``` swift
var limit
```

### `lineColor`

``` swift
var lineColor
```

### `lineDashPhase`

``` swift
var lineDashPhase
```

### `lineDashLengths`

``` swift
var lineDashLengths: [CGFloat]?
```

### `valueTextColor`

``` swift
var valueTextColor = NSUIColor.labelOrBlack
```

### `valueFont`

``` swift
var valueFont
```

### `drawLabelEnabled`

``` swift
var drawLabelEnabled = true
```

### `label`

``` swift
var label = ""
```

### `labelPosition`

``` swift
var labelPosition = LabelPosition.topRight
```

### `lineWidth`

set the line width of the chart (min = 0.2, max = 12); default 2

``` swift
var lineWidth: CGFloat
```
