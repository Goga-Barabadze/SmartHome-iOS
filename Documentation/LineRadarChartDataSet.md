# LineRadarChartDataSet

``` swift
open class LineRadarChartDataSet: LineScatterCandleRadarChartDataSet, ILineRadarChartDataSet
```

## Inheritance

[`LineScatterCandleRadarChartDataSet`](/LineScatterCandleRadarChartDataSet), [`ILineRadarChartDataSet`](/ILineRadarChartDataSet)

## Properties

### `fillColor`

The color that is used for filling the line surface area.

``` swift
var fillColor: NSUIColor
```

### `fill`

The object that is used for filling the area below the line.
**default**:​ nil

``` swift
var fill: Fill?
```

### `fillAlpha`

The alpha value that is used for filling the line surface,
**default**:​ 0.33

``` swift
var fillAlpha
```

### `lineWidth`

line width of the chart (min = 0.0, max = 10)

``` swift
var lineWidth: CGFloat
```

**default**: 1

### `drawFilledEnabled`

Set to `true` if the DataSet should be drawn filled (surface), and not just as a line.
Disabling this will give great performance boost.
Please note that this method uses the path clipping for drawing the filled area (with images, gradients and layers).

``` swift
var drawFilledEnabled = false
```

### `isDrawFilledEnabled`

`true` if filled drawing is enabled, `false` ifnot

``` swift
var isDrawFilledEnabled: Bool
```

## Methods

### `copy(with:)`

``` swift
open override func copy(with zone: NSZone? = nil) -> Any
```
