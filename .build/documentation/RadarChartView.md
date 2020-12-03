# RadarChartView

Implementation of the RadarChart, a "spidernet"-like chart. It works best
when displaying 5-10 entries per DataSet.

``` swift
open class RadarChartView: PieRadarChartViewBase
```

## Inheritance

[`PieRadarChartViewBase`](/PieRadarChartViewBase)

## Initializers

### `init(frame:)`

``` swift
public override init(frame: CGRect)
```

### `init?(coder:)`

``` swift
public required init?(coder aDecoder: NSCoder)
```

## Properties

### `webLineWidth`

width of the web lines that come from the center.

``` swift
var webLineWidth
```

### `innerWebLineWidth`

width of the web lines that are in between the lines coming from the center

``` swift
var innerWebLineWidth
```

### `webColor`

color for the web lines that come from the center

``` swift
var webColor
```

### `innerWebColor`

color for the web lines in between the lines that come from the center.

``` swift
var innerWebColor
```

### `webAlpha`

transparency the grid is drawn with (0.0 - 1.0)

``` swift
var webAlpha: CGFloat = 150.0 / 255.0
```

### `drawWeb`

flag indicating if the web lines should be drawn or not

``` swift
var drawWeb = true
```

### `factor`

The factor that is needed to transform values into pixels.

``` swift
var factor: CGFloat
```

### `sliceAngle`

The angle that each slice in the radar chart occupies.

``` swift
var sliceAngle: CGFloat
```

### `yAxis`

The object that represents all y-labels of the RadarChart.

``` swift
var yAxis: YAxis
```

### `skipWebLineCount`

Sets the number of web-lines that should be skipped on chart web before the next one is drawn. This targets the lines that come from the center of the RadarChart.
if count = 1 -\> 1 line is skipped in between

``` swift
var skipWebLineCount: Int
```

### `radius`

``` swift
var radius: CGFloat
```

### `chartYMax`

The maximum value this chart can display on it's y-axis.

``` swift
var chartYMax: Double
```

### `chartYMin`

The minimum value this chart can display on it's y-axis.

``` swift
var chartYMin: Double
```

### `yRange`

The range of y-values this chart can display.

``` swift
var yRange: Double
```

## Methods

### `notifyDataSetChanged()`

``` swift
open override func notifyDataSetChanged()
```

### `draw(_:)`

``` swift
open override func draw(_ rect: CGRect)
```

### `indexForAngle(_:)`

``` swift
open override func indexForAngle(_ angle: CGFloat) -> Int
```
