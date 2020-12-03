# PieChartDataSet

``` swift
open class PieChartDataSet: ChartDataSet, IPieChartDataSet
```

## Inheritance

[`ChartDataSet`](/ChartDataSet), [`IPieChartDataSet`](/IPieChartDataSet)

## Initializers

### `init()`

``` swift
public required init()
```

### `init(entries:label:)`

``` swift
public override init(entries: [ChartDataEntry]?, label: String?)
```

## Properties

### `sliceSpace`

the space in pixels between the pie-slices
**default**:​ 0
**maximum**:​ 20

``` swift
var sliceSpace: CGFloat
```

### `automaticallyDisableSliceSpacing`

When enabled, slice spacing will be 0.0 when the smallest value is going to be smaller than the slice spacing itself.

``` swift
var automaticallyDisableSliceSpacing: Bool = false
```

### `selectionShift`

indicates the selection distance of a pie slice

``` swift
var selectionShift
```

### `xValuePosition`

``` swift
var xValuePosition: ValuePosition = .insideSlice
```

### `yValuePosition`

``` swift
var yValuePosition: ValuePosition = .insideSlice
```

### `valueLineColor`

When valuePosition is OutsideSlice, indicates line color

``` swift
var valueLineColor: NSUIColor? = NSUIColor.black
```

### `useValueColorForLine`

When valuePosition is OutsideSlice and enabled, line will have the same color as the slice

``` swift
var useValueColorForLine: Bool = false
```

### `valueLineWidth`

When valuePosition is OutsideSlice, indicates line width

``` swift
var valueLineWidth: CGFloat = 1.0
```

### `valueLinePart1OffsetPercentage`

When valuePosition is OutsideSlice, indicates offset as percentage out of the slice size

``` swift
var valueLinePart1OffsetPercentage: CGFloat = 0.75
```

### `valueLinePart1Length`

When valuePosition is OutsideSlice, indicates length of first half of the line

``` swift
var valueLinePart1Length: CGFloat = 0.3
```

### `valueLinePart2Length`

When valuePosition is OutsideSlice, indicates length of second half of the line

``` swift
var valueLinePart2Length: CGFloat = 0.4
```

### `valueLineVariableLength`

When valuePosition is OutsideSlice, this allows variable line length

``` swift
var valueLineVariableLength: Bool = true
```

### `entryLabelFont`

the font for the slice-text labels

``` swift
var entryLabelFont: NSUIFont? = nil
```

### `entryLabelColor`

the color for the slice-text labels

``` swift
var entryLabelColor: NSUIColor? = nil
```

### `highlightColor`

the color for the highlighted sector

``` swift
var highlightColor: NSUIColor? = nil
```

## Methods

### `copy(with:)`

``` swift
open override func copy(with zone: NSZone? = nil) -> Any
```