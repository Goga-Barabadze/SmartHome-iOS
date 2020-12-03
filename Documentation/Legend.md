# Legend

``` swift
@objc(ChartLegend) open class Legend: ComponentBase
```

## Inheritance

[`ComponentBase`](/ComponentBase)

## Initializers

### `init()`

``` swift
public override init()
```

### `init(entries:)`

``` swift
@objc public init(entries: [LegendEntry])
```

## Properties

### `entries`

The legend entries array

``` swift
var entries
```

### `extraEntries`

Entries that will be appended to the end of the auto calculated entries after calculating the legend.
(if the legend has already been calculated, you will need to call notifyDataSetChanged() to let the changes take effect)

``` swift
var extraEntries
```

### `horizontalAlignment`

The horizontal alignment of the legend

``` swift
var horizontalAlignment: HorizontalAlignment = HorizontalAlignment.left
```

### `verticalAlignment`

The vertical alignment of the legend

``` swift
var verticalAlignment: VerticalAlignment = VerticalAlignment.bottom
```

### `orientation`

The orientation of the legend

``` swift
var orientation: Orientation = Orientation.horizontal
```

### `drawInside`

Flag indicating whether the legend will draw inside the chart or outside

``` swift
var drawInside: Bool = false
```

### `isDrawInsideEnabled`

Flag indicating whether the legend will draw inside the chart or outside

``` swift
var isDrawInsideEnabled: Bool
```

### `direction`

The text direction of the legend

``` swift
var direction: Direction = Direction.leftToRight
```

### `font`

``` swift
var font: NSUIFont
```

### `textColor`

``` swift
var textColor = NSUIColor.labelOrBlack
```

### `form`

The form/shape of the legend forms

``` swift
var form = Form.square
```

### `formSize`

The size of the legend forms

``` swift
var formSize
```

### `formLineWidth`

The line width for forms that consist of lines

``` swift
var formLineWidth
```

### `formLineDashPhase`

Line dash configuration for shapes that consist of lines.

``` swift
var formLineDashPhase: CGFloat = 0.0
```

This is how much (in pixels) into the dash pattern are we starting from.

### `formLineDashLengths`

Line dash configuration for shapes that consist of lines.

``` swift
var formLineDashLengths: [CGFloat]?
```

This is the actual dash pattern.
I.e. \[2, 3\] will paint \[--   --   \]
\[1, 3, 4, 2\] will paint \[-   ----  -   ----  \]

### `xEntrySpace`

``` swift
var xEntrySpace
```

### `yEntrySpace`

``` swift
var yEntrySpace
```

### `formToTextSpace`

``` swift
var formToTextSpace
```

### `stackSpace`

``` swift
var stackSpace
```

### `calculatedLabelSizes`

``` swift
var calculatedLabelSizes
```

### `calculatedLabelBreakPoints`

``` swift
var calculatedLabelBreakPoints
```

### `calculatedLineSizes`

``` swift
var calculatedLineSizes
```

### `neededWidth`

``` swift
var neededWidth
```

### `neededHeight`

``` swift
var neededHeight
```

### `textWidthMax`

``` swift
var textWidthMax
```

### `textHeightMax`

``` swift
var textHeightMax
```

### `wordWrapEnabled`

flag that indicates if word wrapping is enabled
this is currently supported only for `orientation == Horizontal`.
you may want to set maxSizePercent when word wrapping, to set the point where the text wraps.

``` swift
var wordWrapEnabled = true
```

**default**: true

### `isWordWrapEnabled`

if this is set, then word wrapping the legend is enabled.

``` swift
var isWordWrapEnabled: Bool
```

### `maxSizePercent`

The maximum relative size out of the whole chart view in percent.
If the legend is to the right/left of the chart, then this affects the width of the legend.
If the legend is to the top/bottom of the chart, then this affects the height of the legend.

``` swift
var maxSizePercent: CGFloat = 0.95
```

**default**: 0.95 (95%)

### `isLegendCustom`

**default**:​ false (automatic legend)
`true` if a custom legend entries has been set

``` swift
var isLegendCustom: Bool
```

## Methods

### `getMaximumEntrySize(withFont:)`

``` swift
@objc open func getMaximumEntrySize(withFont font: NSUIFont) -> CGSize
```

### `calculateDimensions(labelFont:viewPortHandler:)`

``` swift
@objc open func calculateDimensions(labelFont: NSUIFont, viewPortHandler: ViewPortHandler)
```

### `setCustom(entries:)`

MARK:​ - Custom legend
Sets a custom legend's entries array.

``` swift
@objc open func setCustom(entries: [LegendEntry])
```

  - A nil label will start a group.
    This will disable the feature that automatically calculates the legend entries from the datasets.
    Call `resetCustom(...)` to re-enable automatic calculation (and then `notifyDataSetChanged()` is needed).

### `resetCustom()`

Calling this will disable the custom legend entries (set by `setLegend(...)`). Instead, the entries will again be calculated automatically (after `notifyDataSetChanged()` is called).

``` swift
@objc open func resetCustom()
```