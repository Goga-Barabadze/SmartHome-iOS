# Types

  - [Animator](/Animator)
  - [ChartEasingOption](/ChartEasingOption)
  - [BarChartView](/BarChartView):
    Chart that draws bars.
  - [BarLineChartViewBase](/BarLineChartViewBase):
    Base-class of LineChart, BarChart, ScatterChart and CandleStickChart.
  - [BubbleChartView](/BubbleChartView)
  - [CandleStickChartView](/CandleStickChartView):
    Financial chart type that draws candle-sticks.
  - [ChartViewBase](/ChartViewBase)
  - [ChartViewBase.ImageFormat](/ChartViewBase_ImageFormat)
  - [CombinedChartView](/CombinedChartView):
    This chart class allows the combination of lines, bars, scatter and candle data all displayed in one chart area.
  - [CombinedChartView.DrawOrder](/CombinedChartView_DrawOrder):
    enum that allows to specify the order in which the different data objects for the combined-chart are drawn
  - [HorizontalBarChartView](/HorizontalBarChartView):
    BarChart with horizontal bar orientation. In this implementation, x- and y-axis are switched.
  - [LineChartView](/LineChartView):
    Chart that draws lines, surfaces, circles, ...
  - [PieChartView](/PieChartView):
    View that represents a pie chart. Draws cake like slices.
  - [PieRadarChartViewBase](/PieRadarChartViewBase):
    Base class of PieChartView and RadarChartView.
  - [RadarChartView](/RadarChartView):
    Implementation of the RadarChart, a "spidernet"-like chart. It works best
    when displaying 5-10 entries per DataSet.
  - [ScatterChartView](/ScatterChartView):
    The ScatterChart. Draws dots, triangles, squares and custom shapes into the chartview.
  - [AxisBase](/AxisBase):
    Base class for all axes
  - [ChartLimitLine](/ChartLimitLine):
    The limit line is an additional feature for all Line, Bar and ScatterCharts.
    It allows the displaying of an additional line in the chart that marks a certain maximum / limit on the specified axis (x- or y-axis).
  - [ChartLimitLine.LabelPosition](/ChartLimitLine_LabelPosition)
  - [ComponentBase](/ComponentBase):
    This class encapsulates everything both Axis, Legend and LimitLines have in common
  - [Description](/Description)
  - [Legend](/Legend)
  - [Legend.Form](/Legend_Form)
  - [Legend.HorizontalAlignment](/Legend_HorizontalAlignment)
  - [Legend.VerticalAlignment](/Legend_VerticalAlignment)
  - [Legend.Orientation](/Legend_Orientation)
  - [Legend.Direction](/Legend_Direction)
  - [LegendEntry](/LegendEntry)
  - [MarkerImage](/MarkerImage)
  - [MarkerView](/MarkerView)
  - [XAxis](/XAxis)
  - [XAxis.LabelPosition](/XAxis_LabelPosition)
  - [YAxis](/YAxis):
    Class representing the y-axis labels settings and its entries.
    Be aware that not all features the YLabels class provides are suitable for the RadarChart.
    Customizations that affect the value range of the axis need to be applied before setting data for the chart.
  - [YAxis.LabelPosition](/YAxis_LabelPosition)
  - [YAxis.AxisDependency](/YAxis_AxisDependency):
    Enum that specifies the axis a DataSet should be plotted against, either Left or Right.
  - [ChartBaseDataSet](/ChartBaseDataSet)
  - [BarChartData](/BarChartData)
  - [BarChartDataEntry](/BarChartDataEntry)
  - [BarChartDataSet](/BarChartDataSet)
  - [BarLineScatterCandleBubbleChartData](/BarLineScatterCandleBubbleChartData)
  - [BarLineScatterCandleBubbleChartDataSet](/BarLineScatterCandleBubbleChartDataSet)
  - [BubbleChartData](/BubbleChartData)
  - [BubbleChartDataEntry](/BubbleChartDataEntry)
  - [BubbleChartDataSet](/BubbleChartDataSet)
  - [CandleChartData](/CandleChartData)
  - [CandleChartDataEntry](/CandleChartDataEntry)
  - [CandleChartDataSet](/CandleChartDataSet)
  - [ChartData](/ChartData)
  - [ChartDataEntry](/ChartDataEntry)
  - [ChartDataEntryBase](/ChartDataEntryBase)
  - [ChartDataSetRounding](/ChartDataSetRounding):
    Determines how to round DataSet index values for `ChartDataSet.entryIndex(x, rounding)` when an exact x-value is not found.
  - [ChartDataSet](/ChartDataSet):
    The DataSet class represents one group or type of entries (Entry) in the Chart that belong together.
    It is designed to logically separate different groups of values inside the Chart (e.g. the values for a specific line in the LineChart, or the values of a specific group of bars in the BarChart).
  - [CombinedChartData](/CombinedChartData)
  - [LineChartData](/LineChartData):
    Data object that encapsulates all data associated with a LineChart.
  - [LineChartDataSet](/LineChartDataSet)
  - [LineChartDataSet.Mode](/LineChartDataSet_Mode)
  - [LineRadarChartDataSet](/LineRadarChartDataSet)
  - [LineScatterCandleRadarChartDataSet](/LineScatterCandleRadarChartDataSet)
  - [PieChartData](/PieChartData)
  - [PieChartDataEntry](/PieChartDataEntry)
  - [PieChartDataSet](/PieChartDataSet)
  - [PieChartDataSet.ValuePosition](/PieChartDataSet_ValuePosition)
  - [RadarChartData](/RadarChartData)
  - [RadarChartDataEntry](/RadarChartDataEntry)
  - [RadarChartDataSet](/RadarChartDataSet)
  - [ScatterChartData](/ScatterChartData)
  - [ScatterChartDataSet](/ScatterChartDataSet)
  - [ScatterChartDataSet.Shape](/ScatterChartDataSet_Shape)
  - [DataApproximator](/DataApproximator)
  - [DefaultAxisValueFormatter](/DefaultAxisValueFormatter)
  - [DefaultFillFormatter](/DefaultFillFormatter):
    Default formatter that calculates the position of the filled line.
  - [DefaultValueFormatter](/DefaultValueFormatter)
  - [IndexAxisValueFormatter](/IndexAxisValueFormatter):
    This formatter is used for passing an array of x-axis labels, on whole x steps.
  - [BarHighlighter](/BarHighlighter)
  - [ChartHighlighter](/ChartHighlighter)
  - [CombinedHighlighter](/CombinedHighlighter)
  - [Highlight](/Highlight)
  - [HorizontalBarHighlighter](/HorizontalBarHighlighter)
  - [PieHighlighter](/PieHighlighter)
  - [PieRadarHighlighter](/PieRadarHighlighter)
  - [RadarHighlighter](/RadarHighlighter)
  - [Range](/Range)
  - [AnimatedMoveViewJob](/AnimatedMoveViewJob)
  - [AnimatedViewPortJob](/AnimatedViewPortJob)
  - [AnimatedZoomViewJob](/AnimatedZoomViewJob)
  - [MoveViewJob](/MoveViewJob)
  - [ViewPortJob](/ViewPortJob)
  - [ZoomViewJob](/ZoomViewJob)
  - [AxisRendererBase](/AxisRendererBase)
  - [BarChartRenderer](/BarChartRenderer)
  - [BarLineScatterCandleBubbleRenderer](/BarLineScatterCandleBubbleRenderer)
  - [BarLineScatterCandleBubbleRenderer.XBounds](/BarLineScatterCandleBubbleRenderer_XBounds):
    Class representing the bounds of the current viewport in terms of indices in the values array of a DataSet.
  - [BarLineScatterCandleBubbleRenderer.XBounds.Iterator](/BarLineScatterCandleBubbleRenderer_XBounds_Iterator)
  - [BubbleChartRenderer](/BubbleChartRenderer)
  - [CandleStickChartRenderer](/CandleStickChartRenderer)
  - [DataRenderer](/DataRenderer)
  - [CombinedChartRenderer](/CombinedChartRenderer)
  - [HorizontalBarChartRenderer](/HorizontalBarChartRenderer)
  - [LegendRenderer](/LegendRenderer)
  - [LineChartRenderer](/LineChartRenderer)
  - [LineRadarRenderer](/LineRadarRenderer)
  - [LineScatterCandleRadarRenderer](/LineScatterCandleRadarRenderer)
  - [PieChartRenderer](/PieChartRenderer)
  - [RadarChartRenderer](/RadarChartRenderer)
  - [Renderer](/Renderer)
  - [ChevronDownShapeRenderer](/ChevronDownShapeRenderer)
  - [ChevronUpShapeRenderer](/ChevronUpShapeRenderer)
  - [CircleShapeRenderer](/CircleShapeRenderer)
  - [CrossShapeRenderer](/CrossShapeRenderer)
  - [SquareShapeRenderer](/SquareShapeRenderer)
  - [TriangleShapeRenderer](/TriangleShapeRenderer)
  - [XShapeRenderer](/XShapeRenderer)
  - [ScatterChartRenderer](/ScatterChartRenderer)
  - [XAxisRenderer](/XAxisRenderer)
  - [XAxisRendererHorizontalBarChart](/XAxisRendererHorizontalBarChart)
  - [XAxisRendererRadarChart](/XAxisRendererRadarChart)
  - [YAxisRenderer](/YAxisRenderer)
  - [YAxisRendererHorizontalBarChart](/YAxisRendererHorizontalBarChart)
  - [YAxisRendererRadarChart](/YAxisRendererRadarChart)
  - [ChartColorTemplates](/ChartColorTemplates)
  - [ChartUtils](/ChartUtils)
  - [FillType](/FillType)
  - [Fill](/Fill)
  - [NSUIAccessibilityElement](/NSUIAccessibilityElement):
    A simple abstraction over UIAccessibilityElement and NSAccessibilityElement.
  - [NSUIAccessibilityElement](/NSUIAccessibilityElement):
    A simple abstraction over UIAccessibilityElement and NSAccessibilityElement.
  - [NSUIView](/NSUIView)
  - [NSUIDisplayLink](/NSUIDisplayLink):
    On OS X there is no CADisplayLink. Use a 60 fps timer to render the animations.
  - [NSUIView](/NSUIView)
  - [Transformer](/Transformer):
    Transformer class that contains all matrices and is responsible for transforming values into pixels on the screen and backwards.
  - [TransformerHorizontalBarChart](/TransformerHorizontalBarChart)
  - [ViewPortHandler](/ViewPortHandler):
    Class that contains information about the charts current viewport settings, including offsets, scale & translation levels, ...

# Protocols

  - [AnimatorDelegate](/AnimatorDelegate)
  - [ChartViewDelegate](/ChartViewDelegate)
  - [IMarker](/IMarker)
  - [IBarChartDataSet](/IBarChartDataSet)
  - [IBarLineScatterCandleBubbleChartDataSet](/IBarLineScatterCandleBubbleChartDataSet)
  - [IBubbleChartDataSet](/IBubbleChartDataSet)
  - [ICandleChartDataSet](/ICandleChartDataSet)
  - [IChartDataSet](/IChartDataSet)
  - [ILineChartDataSet](/ILineChartDataSet)
  - [ILineRadarChartDataSet](/ILineRadarChartDataSet)
  - [ILineScatterCandleRadarChartDataSet](/ILineScatterCandleRadarChartDataSet)
  - [IPieChartDataSet](/IPieChartDataSet)
  - [IRadarChartDataSet](/IRadarChartDataSet)
  - [IScatterChartDataSet](/IScatterChartDataSet)
  - [IAxisValueFormatter](/IAxisValueFormatter):
    An interface for providing custom axis Strings.
  - [IFillFormatter](/IFillFormatter):
    Protocol for providing a custom logic to where the filling line of a LineDataSet should end. This of course only works if setFillEnabled(...) is set to true.
  - [IValueFormatter](/IValueFormatter):
    Interface that allows custom formatting of all values inside the chart before they are drawn to the screen.
  - [IHighlighter](/IHighlighter)
  - [BarChartDataProvider](/BarChartDataProvider)
  - [BarLineScatterCandleBubbleChartDataProvider](/BarLineScatterCandleBubbleChartDataProvider)
  - [BubbleChartDataProvider](/BubbleChartDataProvider)
  - [CandleChartDataProvider](/CandleChartDataProvider)
  - [ChartDataProvider](/ChartDataProvider)
  - [CombinedChartDataProvider](/CombinedChartDataProvider)
  - [LineChartDataProvider](/LineChartDataProvider)
  - [ScatterChartDataProvider](/ScatterChartDataProvider)
  - [IShapeRenderer](/IShapeRenderer)

# Global Typealiases

  - [ChartEasingFunctionBlock](/ChartEasingFunctionBlock)
  - [NSUIColor](/NSUIColor)
  - [NSUIColor](/NSUIColor)
  - [NSUIGestureRecognizer](/NSUIGestureRecognizer)
  - [NSUIGestureRecognizerState](/NSUIGestureRecognizerState)
  - [NSUIGestureRecognizerDelegate](/NSUIGestureRecognizerDelegate)
  - [NSUITapGestureRecognizer](/NSUITapGestureRecognizer)
  - [NSUIPanGestureRecognizer](/NSUIPanGestureRecognizer)
  - [NSUIPinchGestureRecognizer](/NSUIPinchGestureRecognizer)
  - [NSUIRotationGestureRecognizer](/NSUIRotationGestureRecognizer)
  - [NSUIGestureRecognizer](/NSUIGestureRecognizer)
  - [NSUIGestureRecognizerState](/NSUIGestureRecognizerState)
  - [NSUIGestureRecognizerDelegate](/NSUIGestureRecognizerDelegate)
  - [NSUITapGestureRecognizer](/NSUITapGestureRecognizer)
  - [NSUIPanGestureRecognizer](/NSUIPanGestureRecognizer)
  - [NSUIPinchGestureRecognizer](/NSUIPinchGestureRecognizer)
  - [NSUIRotationGestureRecognizer](/NSUIRotationGestureRecognizer)
  - [NSUIEvent](/NSUIEvent)
  - [NSUITouch](/NSUITouch)
  - [NSUIEvent](/NSUIEvent)
  - [NSUITouch](/NSUITouch)
  - [NSUIFont](/NSUIFont)
  - [NSUIImage](/NSUIImage)
  - [NSUIScrollView](/NSUIScrollView)
  - [NSUIScreen](/NSUIScreen)
  - [NSUIDisplayLink](/NSUIDisplayLink)
  - [NSUIFont](/NSUIFont)
  - [NSUIImage](/NSUIImage)
  - [NSUIScrollView](/NSUIScrollView)
  - [NSUIScreen](/NSUIScreen)
