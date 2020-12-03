# NSUIAccessibilityElement

<dl>
<dt><code>os(OSX)</code></dt>
<dd>

A simple abstraction over UIAccessibilityElement and NSAccessibilityElement.

``` swift
open class NSUIAccessibilityElement: NSAccessibilityElement
```

</dd>
</dl>

## Inheritance

`NSAccessibilityElement`, `UIAccessibilityElement`

## Initializers

### `init(accessibilityContainer:)`

<dl>
<dt><code>os(iOS) || os(tvOS)</code></dt>
<dd>

``` swift
override public init(accessibilityContainer container: Any)
```

</dd>
</dl>

### `init(accessibilityContainer:)`

<dl>
<dt><code>os(OSX)</code></dt>
<dd>

``` swift
public init(accessibilityContainer container: Any)
```

</dd>
</dl>

## Properties

### `accessibilityFrame`

<dl>
<dt><code>os(iOS) || os(tvOS)</code></dt>
<dd>

``` swift
var accessibilityFrame: CGRect
```

</dd>
</dl>

### `accessibilityLabel`

<dl>
<dt><code>os(OSX)</code></dt>
<dd>

``` swift
var accessibilityLabel: String
```

</dd>
</dl>

### `accessibilityFrame`

<dl>
<dt><code>os(OSX)</code></dt>
<dd>

``` swift
var accessibilityFrame: NSRect
```

</dd>
</dl>
