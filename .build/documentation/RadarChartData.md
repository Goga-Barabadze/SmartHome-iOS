# RadarChartData

``` swift
open class RadarChartData: ChartData
```

## Inheritance

[`ChartData`](/ChartData)

## Initializers

### `init()`

``` swift
public override init()
```

### `init(dataSets:)`

``` swift
public override init(dataSets: [IChartDataSet]?)
```

## Properties

### `highlightColor`

``` swift
var highlightColor
```

### `highlightLineWidth`

``` swift
var highlightLineWidth
```

### `highlightLineDashPhase`

``` swift
var highlightLineDashPhase
```

### `highlightLineDashLengths`

``` swift
var highlightLineDashLengths: [CGFloat]?
```

### `labels`

Sets labels that should be drawn around the RadarChart at the end of each web line.

``` swift
var labels
```

## Methods

### `setLabels(_:)`

Sets the labels that should be drawn around the RadarChart at the end of each web line.

``` swift
open func setLabels(_ labels: String)
```

### `entryForHighlight(_:)`

``` swift
open override func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
```