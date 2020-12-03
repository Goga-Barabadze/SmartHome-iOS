# CandleChartDataEntry

``` swift
open class CandleChartDataEntry: ChartDataEntry
```

## Inheritance

[`ChartDataEntry`](/ChartDataEntry)

## Initializers

### `init()`

``` swift
public required init()
```

### `init(x:shadowH:shadowL:open:close:)`

``` swift
@objc public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double)
```

### `init(x:shadowH:shadowL:open:close:icon:)`

``` swift
@objc public convenience init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, icon: NSUIImage?)
```

### `init(x:shadowH:shadowL:open:close:data:)`

``` swift
@objc public convenience init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, data: Any?)
```

### `init(x:shadowH:shadowL:open:close:icon:data:)`

``` swift
@objc public convenience init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, icon: NSUIImage?, data: Any?)
```

## Properties

### `high`

shadow-high value

``` swift
var high
```

### `low`

shadow-low value

``` swift
var low
```

### `close`

close value

``` swift
var close
```

### `open`

open value

``` swift
var open
```

### `shadowRange`

The overall range (difference) between shadow-high and shadow-low.

``` swift
var shadowRange: Double
```

### `bodyRange`

The body size (difference between open and close).

``` swift
var bodyRange: Double
```

### `y`

the center value of the candle. (Middle value between high and low)

``` swift
var y: Double
```

## Methods

### `copy(with:)`

``` swift
open override func copy(with zone: NSZone? = nil) -> Any
```
