# AxisBase

Base class for all axes

``` swift
@objc(ChartAxisBase) open class AxisBase: ComponentBase
```

## Inheritance

[`ComponentBase`](/ComponentBase)

## Initializers

### `init()`

``` swift
public override init()
```

## Properties

### `labelFont`

``` swift
var labelFont
```

### `labelTextColor`

``` swift
var labelTextColor = NSUIColor.labelOrBlack
```

### `axisLineColor`

``` swift
var axisLineColor = NSUIColor.gray
```

### `axisLineWidth`

``` swift
var axisLineWidth
```

### `axisLineDashPhase`

``` swift
var axisLineDashPhase
```

### `axisLineDashLengths`

``` swift
var axisLineDashLengths: [CGFloat]!
```

### `gridColor`

``` swift
var gridColor
```

### `gridLineWidth`

``` swift
var gridLineWidth
```

### `gridLineDashPhase`

``` swift
var gridLineDashPhase
```

### `gridLineDashLengths`

``` swift
var gridLineDashLengths: [CGFloat]!
```

### `gridLineCap`

``` swift
var gridLineCap = CGLineCap.butt
```

### `drawGridLinesEnabled`

``` swift
var drawGridLinesEnabled = true
```

### `drawAxisLineEnabled`

``` swift
var drawAxisLineEnabled = true
```

### `drawLabelsEnabled`

flag that indicates of the labels of this axis should be drawn or not

``` swift
var drawLabelsEnabled = true
```

### `centerAxisLabelsEnabled`

Centers the axis labels instead of drawing them at their original position.
This is useful especially for grouped BarChart.

``` swift
var centerAxisLabelsEnabled: Bool
```

### `isCenterAxisLabelsEnabled`

``` swift
var isCenterAxisLabelsEnabled: Bool
```

### `drawLimitLinesBehindDataEnabled`

Are the LimitLines drawn behind the data or in front of the data?

``` swift
var drawLimitLinesBehindDataEnabled = false
```

**default**: false

### `drawGridLinesBehindDataEnabled`

Are the grid lines drawn behind the data or in front of the data?

``` swift
var drawGridLinesBehindDataEnabled = true
```

**default**: true

### `gridAntialiasEnabled`

the flag can be used to turn off the antialias for grid lines

``` swift
var gridAntialiasEnabled = true
```

### `entries`

the actual array of entries

``` swift
var entries
```

### `centeredEntries`

axis label entries only used for centered labels

``` swift
var centeredEntries
```

### `entryCount`

the number of entries the legend contains

``` swift
var entryCount: Int
```

### `decimals`

the number of decimal digits to use (for the default formatter

``` swift
var decimals: Int = 0
```

### `granularityEnabled`

When true, axis labels are controlled by the `granularity` property.
When false, axis values could possibly be repeated.
This could happen if two adjacent axis values are rounded to same value.
If using granularity this could be avoided by having fewer axis values visible.

``` swift
var granularityEnabled = false
```

### `granularity`

The minimum interval between axis values.
This can be used to avoid label duplicating when zooming in.

``` swift
var granularity: Double
```

**default**: 1.0

### `isGranularityEnabled`

The minimum interval between axis values.

``` swift
var isGranularityEnabled: Bool
```

### `forceLabelsEnabled`

if true, the set number of y-labels will be forced

``` swift
var forceLabelsEnabled = false
```

### `valueFormatter`

Sets the formatter to be used for formatting the axis labels.
If no formatter is set, the chart will automatically determine a reasonable formatting (concerning decimals) for all the values that are drawn inside the chart.
Use `nil` to use the formatter calculated by the chart.

``` swift
var valueFormatter: IAxisValueFormatter?
```

### `isDrawGridLinesEnabled`

``` swift
var isDrawGridLinesEnabled: Bool
```

### `isDrawAxisLineEnabled`

``` swift
var isDrawAxisLineEnabled: Bool
```

### `isDrawLabelsEnabled`

``` swift
var isDrawLabelsEnabled: Bool
```

### `isDrawLimitLinesBehindDataEnabled`

Are the LimitLines drawn behind the data or in front of the data?

``` swift
var isDrawLimitLinesBehindDataEnabled: Bool
```

**default**: false

### `isDrawGridLinesBehindDataEnabled`

Are the grid lines drawn behind the data or in front of the data?

``` swift
var isDrawGridLinesBehindDataEnabled: Bool
```

**default**: true

### `spaceMin`

Extra spacing for `axisMinimum` to be added to automatically calculated `axisMinimum`

``` swift
var spaceMin: Double = 0.0
```

### `spaceMax`

Extra spacing for `axisMaximum` to be added to automatically calculated `axisMaximum`

``` swift
var spaceMax: Double = 0.0
```

### `axisRange`

the total range of values this axis covers

``` swift
var axisRange
```

### `axisMinLabels`

The minumum number of labels on the axis

``` swift
var axisMinLabels
```

### `axisMaxLabels`

The maximum number of labels on the axis

``` swift
var axisMaxLabels
```

### `labelCount`

the number of label entries the axis should have
max = 25,
min = 2,
default = 6,
be aware that this number is not fixed and can only be approximated

``` swift
var labelCount: Int
```

### `isForceLabelsEnabled`

`true` if focing the y-label count is enabled. Default:​ false

``` swift
var isForceLabelsEnabled: Bool
```

### `limitLines`

The LimitLines of this axis.

``` swift
var limitLines: [ChartLimitLine]
```

### `isAxisMinCustom`

``` swift
var isAxisMinCustom: Bool
```

### `isAxisMaxCustom`

``` swift
var isAxisMaxCustom: Bool
```

### `axisMinimum`

The minimum value for this axis.
If set, this value will not be calculated automatically depending on the provided data.
Use `resetCustomAxisMin()` to undo this.

``` swift
var axisMinimum: Double
```

### `axisMaximum`

The maximum value for this axis.
If set, this value will not be calculated automatically depending on the provided data.
Use `resetCustomAxisMax()` to undo this.

``` swift
var axisMaximum: Double
```

## Methods

### `getLongestLabel()`

``` swift
@objc open func getLongestLabel() -> String
```

### `getFormattedLabel(_:)`

``` swift
@objc open func getFormattedLabel(_ index: Int) -> String
```

#### Returns

The formatted label at the specified index. This will either use the auto-formatter or the custom formatter (if one is set).

### `setLabelCount(_:force:)`

``` swift
@objc open func setLabelCount(_ count: Int, force: Bool)
```

### `addLimitLine(_:)`

Adds a new ChartLimitLine to this axis.

``` swift
@objc open func addLimitLine(_ line: ChartLimitLine)
```

### `removeLimitLine(_:)`

Removes the specified ChartLimitLine from the axis.

``` swift
@objc open func removeLimitLine(_ line: ChartLimitLine)
```

### `removeAllLimitLines()`

Removes all LimitLines from the axis.

``` swift
@objc open func removeAllLimitLines()
```

### `resetCustomAxisMin()`

By calling this method, any custom minimum value that has been previously set is reseted, and the calculation is done automatically.

``` swift
@objc open func resetCustomAxisMin()
```

### `resetCustomAxisMax()`

By calling this method, any custom maximum value that has been previously set is reseted, and the calculation is done automatically.

``` swift
@objc open func resetCustomAxisMax()
```

### `calculate(min:max:)`

Calculates the minimum, maximum and range values of the YAxis with the given minimum and maximum values from the chart data.

``` swift
@objc open func calculate(min dataMin: Double, max dataMax: Double)
```

#### Parameters

  - dataMin: the y-min value according to chart data
  - dataMax: the y-max value according to chart
