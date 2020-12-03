# YAxis

Class representing the y-axis labels settings and its entries.
Be aware that not all features the YLabels class provides are suitable for the RadarChart.
Customizations that affect the value range of the axis need to be applied before setting data for the chart.

``` swift
@objc(ChartYAxis) open class YAxis: AxisBase
```

## Inheritance

[`AxisBase`](/AxisBase)

## Initializers

### `init()`

``` swift
public override init()
```

### `init(position:)`

``` swift
@objc public init(position: AxisDependency)
```

## Properties

### `drawBottomYLabelEntryEnabled`

indicates if the bottom y-label entry is drawn or not

``` swift
var drawBottomYLabelEntryEnabled = true
```

### `drawTopYLabelEntryEnabled`

indicates if the top y-label entry is drawn or not

``` swift
var drawTopYLabelEntryEnabled = true
```

### `inverted`

flag that indicates if the axis is inverted or not

``` swift
var inverted = false
```

### `drawZeroLineEnabled`

flag that indicates if the zero-line should be drawn regardless of other grid lines

``` swift
var drawZeroLineEnabled = false
```

### `zeroLineColor`

Color of the zero line

``` swift
var zeroLineColor: NSUIColor? = NSUIColor.gray
```

### `zeroLineWidth`

Width of the zero line

``` swift
var zeroLineWidth: CGFloat = 1.0
```

### `zeroLineDashPhase`

This is how much (in pixels) into the dash pattern are we starting from.

``` swift
var zeroLineDashPhase
```

### `zeroLineDashLengths`

This is the actual dash pattern.
I.e. \[2, 3\] will paint \[--   --   \]
\[1, 3, 4, 2\] will paint \[-   ----  -   ----  \]

``` swift
var zeroLineDashLengths: [CGFloat]?
```

### `spaceTop`

axis space from the largest value to the top in percent of the total axis range

``` swift
var spaceTop
```

### `spaceBottom`

axis space from the smallest value to the bottom in percent of the total axis range

``` swift
var spaceBottom
```

### `labelPosition`

the position of the y-labels relative to the chart

``` swift
var labelPosition = LabelPosition.outsideChart
```

### `labelAlignment`

the alignment of the text in the y-label

``` swift
var labelAlignment: NSTextAlignment = .left
```

### `labelXOffset`

the horizontal offset of the y-label

``` swift
var labelXOffset: CGFloat = 0.0
```

### `minWidth`

the minimum width that the axis should take

``` swift
var minWidth
```

**default**: 0.0

### `maxWidth`

the maximum width that the axis can take.
use Infinity for disabling the maximum.

``` swift
var maxWidth
```

**default**: CGFloat.infinity

### `axisDependency`

``` swift
var axisDependency: AxisDependency
```

### `needsOffset`

`true` if this axis needs horizontal offset, `false` ifno offset is needed.

``` swift
var needsOffset: Bool
```

### `isInverted`

``` swift
var isInverted: Bool
```

### `isDrawBottomYLabelEntryEnabled`

``` swift
var isDrawBottomYLabelEntryEnabled: Bool
```

### `isDrawTopYLabelEntryEnabled`

``` swift
var isDrawTopYLabelEntryEnabled: Bool
```

## Methods

### `requiredSize()`

``` swift
@objc open func requiredSize() -> CGSize
```

### `getRequiredHeightSpace()`

``` swift
@objc open func getRequiredHeightSpace() -> CGFloat
```

### `calculate(min:max:)`

``` swift
open override func calculate(min dataMin: Double, max dataMax: Double)
```
