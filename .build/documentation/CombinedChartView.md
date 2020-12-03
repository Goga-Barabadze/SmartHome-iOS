# CombinedChartView

This chart class allows the combination of lines, bars, scatter and candle data all displayed in one chart area.

``` swift
open class CombinedChartView: BarLineChartViewBase, CombinedChartDataProvider
```

## Inheritance

[`BarLineChartViewBase`](/BarLineChartViewBase), [`CombinedChartDataProvider`](/CombinedChartDataProvider)

## Properties

### `data`

``` swift
var data: ChartData?
```

### `fillFormatter`

``` swift
var fillFormatter: IFillFormatter
```

### `combinedData`

``` swift
var combinedData: CombinedChartData?
```

### `lineData`

``` swift
var lineData: LineChartData?
```

### `barData`

``` swift
var barData: BarChartData?
```

### `scatterData`

``` swift
var scatterData: ScatterChartData?
```

### `candleData`

``` swift
var candleData: CandleChartData?
```

### `bubbleData`

``` swift
var bubbleData: BubbleChartData?
```

### `drawValueAboveBarEnabled`

if set to true, all values are drawn above their bars, instead of below their top

``` swift
var drawValueAboveBarEnabled: Bool
```

### `drawBarShadowEnabled`

if set to true, a grey area is drawn behind each bar that indicates the maximum value

``` swift
var drawBarShadowEnabled: Bool
```

### `isDrawValueAboveBarEnabled`

`true` if drawing values above bars is enabled, `false` ifnot

``` swift
var isDrawValueAboveBarEnabled: Bool
```

### `isDrawBarShadowEnabled`

`true` if drawing shadows (maxvalue) for each bar is enabled, `false` ifnot

``` swift
var isDrawBarShadowEnabled: Bool
```

### `drawOrder`

the order in which the provided data objects should be drawn.
The earlier you place them in the provided array, the further they will be in the background.
e.g. if you provide \[DrawOrder.Bar, DrawOrder.Line\], the bars will be drawn behind the lines.

``` swift
var drawOrder: [Int]
```

### `highlightFullBarEnabled`

Set this to `true` to make the highlight operation full-bar oriented, `false` to make it highlight single values

``` swift
var highlightFullBarEnabled: Bool = false
```

### `isHighlightFullBarEnabled`

`true` the highlight is be full-bar oriented, `false` ifsingle-value

``` swift
var isHighlightFullBarEnabled: Bool
```

## Methods

### `initialize()`

``` swift
open override func initialize()
```

### `getHighlightByTouchPoint(_:)`

``` swift
open override func getHighlightByTouchPoint(_ pt: CGPoint) -> Highlight?
```

#### Returns

The Highlight object (contains x-index and DataSet index) of the selected value at the given touch point inside the CombinedChart.
