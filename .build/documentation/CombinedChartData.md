# CombinedChartData

``` swift
open class CombinedChartData: BarLineScatterCandleBubbleChartData
```

## Inheritance

[`BarLineScatterCandleBubbleChartData`](/BarLineScatterCandleBubbleChartData)

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

### `lineData`

``` swift
var lineData: LineChartData!
```

### `barData`

``` swift
var barData: BarChartData!
```

### `scatterData`

``` swift
var scatterData: ScatterChartData!
```

### `candleData`

``` swift
var candleData: CandleChartData!
```

### `bubbleData`

``` swift
var bubbleData: BubbleChartData!
```

### `allData`

All data objects in row:​ line-bar-scatter-candle-bubble if not null.

``` swift
var allData: [ChartData]
```

## Methods

### `calcMinMax()`

``` swift
open override func calcMinMax()
```

### `dataByIndex(_:)`

``` swift
@objc open func dataByIndex(_ index: Int) -> ChartData
```

### `dataIndex(_:)`

``` swift
open func dataIndex(_ data: ChartData) -> Int?
```

### `removeDataSet(_:)`

``` swift
open override func removeDataSet(_ dataSet: IChartDataSet) -> Bool
```

### `removeDataSetByIndex(_:)`

``` swift
open override func removeDataSetByIndex(_ index: Int) -> Bool
```

### `removeEntry(_:dataSetIndex:)`

``` swift
open override func removeEntry(_ entry: ChartDataEntry, dataSetIndex: Int) -> Bool
```

### `removeEntry(xValue:dataSetIndex:)`

``` swift
open override func removeEntry(xValue: Double, dataSetIndex: Int) -> Bool
```

### `notifyDataChanged()`

``` swift
open override func notifyDataChanged()
```

### `entryForHighlight(_:)`

Get the Entry for a corresponding highlight object

``` swift
open override func entryForHighlight(_ highlight: Highlight) -> ChartDataEntry?
```

#### Parameters

  - highlight:

#### Returns

The entry that is highlighted

### `getDataSetByHighlight(_:)`

Get dataset for highlight

``` swift
@objc open func getDataSetByHighlight(_ highlight: Highlight) -> IChartDataSet!
```

#### Parameters

  - highlight: current highlight

#### Returns

dataset related to highlight
