import SwiftUI

public enum CompoundColors {
    public static let coreAccent = Color(red: 0.051, green: 0.741, blue: 0.545, opacity: 1)
    public static let coreAlert = Color(red: 1.000, green: 0.357, blue: 0.333, opacity: 1)
    public static let coreLinks = Color(red: 0.000, green: 0.525, blue: 0.902, opacity: 1)
    public static let corePrimaryContent = Color(red: 0.090, green: 0.098, blue: 0.110, opacity: 1)
    public static let coreSecondaryContent = Color(red: 0.451, green: 0.490, blue: 0.549, opacity: 1)
    public static let coreTertiaryContent = Color(red: 0.553, green: 0.592, blue: 0.647, opacity: 1)
    public static let coreQuaternaryContent = Color(red: 0.757, green: 0.776, blue: 0.804, opacity: 1)
    public static let coreQuinaryContent = Color(red: 0.890, green: 0.910, blue: 0.941, opacity: 1)
    public static let coreSystem = Color(red: 0.957, green: 0.965, blue: 0.980, opacity: 1)
    public static let coreBackground = Color(red: 1.000, green: 1.000, blue: 1.000, opacity: 1)
    public static let coreContentName01 = Color(red: 0.212, green: 0.545, blue: 0.839, opacity: 1)
    public static let coreContentName02 = Color(red: 0.675, green: 0.231, blue: 0.659, opacity: 1)
    public static let coreContentName03 = Color(red: 0.012, green: 0.702, blue: 0.506, opacity: 1)
    public static let coreContentName04 = Color(red: 0.902, green: 0.310, blue: 0.478, opacity: 1)
    public static let coreContentName05 = Color(red: 1.000, green: 0.506, blue: 0.176, opacity: 1)
    public static let coreContentName06 = Color(red: 0.176, green: 0.761, blue: 0.773, opacity: 1)
    public static let coreContentName07 = Color(red: 0.361, green: 0.337, blue: 0.961, opacity: 1)
    public static let coreContentName08 = Color(red: 0.455, green: 0.820, blue: 0.173, opacity: 1)
    
    /// All of the colors from Compound in a dictionary that can be iterated through.
    public static var allColors: [String: Color] {
        [
            "coreAccent": coreAccent,
            "coreAlert": coreAlert,
            "coreLinks": coreLinks,
            "corePrimaryContent": corePrimaryContent,
            "coreSecondaryContent": coreSecondaryContent,
            "coreTertiaryContent": coreTertiaryContent,
            "coreQuaternaryContent": coreQuaternaryContent,
            "coreQuinaryContent": coreQuinaryContent,
            "coreSystem": coreSystem,
            "coreBackground": coreBackground,
            "coreContentName01": coreContentName01,
            "coreContentName02": coreContentName02,
            "coreContentName03": coreContentName03,
            "coreContentName04": coreContentName04,
            "coreContentName05": coreContentName05,
            "coreContentName06": coreContentName06,
            "coreContentName07": coreContentName07,
            "coreContentName08": coreContentName08,
        ]
    }
}