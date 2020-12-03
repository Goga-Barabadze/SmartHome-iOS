# RadarChartDataSet

``` swift
open class RadarChartDataSet: LineRadarChartDataSet, IRadarChartDataSet
```

## Inheritance

[`LineRadarChartDataSet`](/LineRadarChartDataSet), [`IRadarChartDataSet`](/IRadarChartDataSet)

## Initializers

### `init()`

``` swift
public required init()
```

### `init(entries:label:)`

``` swift
public required override init(entries: [ChartDataEntry]?, label: String?)
```

## Properties

### `drawHighlightCircleEnabled`

flag indicating whether highlight circle should be drawn or not
**default**:​ false

``` swift
var drawHighlightCircleEnabled: Bool = false
```

### `isDrawHighlightCircleEnabled`

`true` if highlight circle should be drawn, `false` ifnot

``` swift
var isDrawHighlightCircleEnabled: Bool
```

### `highlightCircleFillColor`

``` swift
var highlightCircleFillColor: NSUIColor? = NSUIColor.white
```

### `highlightCircleStrokeColor`

The stroke color for highlight circle.
If `nil`, the color of the dataset is taken.

``` swift
var highlightCircleStrokeColor: NSUIColor?
```

### `highlightCircleStrokeAlpha`

``` swift
var highlightCircleStrokeAlpha: CGFloat = 0.3
```

### `highlightCircleInnerRadius`

``` swift
var highlightCircleInnerRadius: CGFloat = 3.0
```

### `highlightCircleOuterRadius`

``` swift
var highlightCircleOuterRadius: CGFloat = 4.0
```

### `highlightCircleStrokeWidth`

``` swift
var highlightCircleStrokeWidth: CGFloat = 2.0
```
