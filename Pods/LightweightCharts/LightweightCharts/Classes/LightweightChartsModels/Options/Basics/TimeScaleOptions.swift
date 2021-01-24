import Foundation

public struct TimeScaleOptions {
    
    public var rightOffset: Double?
    public var barSpacing: Double?
    public var fixLeftEdge: Bool?
    public var lockVisibleTimeRangeOnResize: Bool?
    public var rightBarStaysOnScroll: Bool?
    public var borderVisible: Bool?
    public var borderColor: ChartColor?
    public var visible: Bool?
    public var timeVisible: Bool?
    public var secondsVisible: Bool?
    
    public var tickMarkFormatter: JavaScriptMethod<TickMarkFormatterParameters, String>? {
        get {
            tickMarkFormatterJSFunction?.function
        }
        set {
            tickMarkFormatterJSFunction = newValue.map { JSFunction(prompt: .tickMarkFormatter, function: $0) }
        }
    }
    var tickMarkFormatterJSFunction: JSFunction<TickMarkFormatterParameters, String>?
    
    public init(rightOffset: Double? = nil,
                barSpacing: Double? = nil,
                fixLeftEdge: Bool? = nil,
                lockVisibleTimeRangeOnResize: Bool? = nil,
                rightBarStaysOnScroll: Bool? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                visible: Bool? = nil,
                timeVisible: Bool? = nil,
                secondsVisible: Bool? = nil,
                tickMarkFormatter: JavaScriptMethod<TickMarkFormatterParameters, String>? = nil) {
        self.rightOffset = rightOffset
        self.barSpacing = barSpacing
        self.fixLeftEdge = fixLeftEdge
        self.lockVisibleTimeRangeOnResize = lockVisibleTimeRangeOnResize
        self.rightBarStaysOnScroll = rightBarStaysOnScroll
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.visible = visible
        self.timeVisible = timeVisible
        self.secondsVisible = secondsVisible
        self.tickMarkFormatter = tickMarkFormatter
    }

}

// MARK: - Codable
extension TimeScaleOptions: Codable {
    
    enum CodingKeys: String, CodingKey {
        case rightOffset
        case barSpacing
        case fixLeftEdge
        case lockVisibleTimeRangeOnResize
        case rightBarStaysOnScroll
        case borderVisible
        case borderColor
        case visible
        case timeVisible
        case secondsVisible
    }
    
}

// MARK: -
extension TimeScaleOptions {
    
    func optionsScript(for closuresStore: ClosuresStore?) -> (options: String, variableName: String) {
        let variableName = "options"
        var optionsScript = "var \(variableName) = \(jsonString);"
        if let formatter = tickMarkFormatterJSFunction {
            closuresStore?.addMethod(formatter.function, forName: formatter.name)
            optionsScript.append("\(variableName).tickMarkFormatter = \(formatter.script());")
        }
        return (optionsScript, variableName)
    }
    
}
