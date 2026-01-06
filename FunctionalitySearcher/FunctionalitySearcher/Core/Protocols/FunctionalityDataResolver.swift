import Foundation

/// Protocol for resolving additional data required by functionalities
/// that is not stored in AppContext
protocol FunctionalityDataResolver {
    /// Resolves additional data for a specific functionality
    /// - Parameters:
    ///   - functionality: The functionality that needs data
    ///   - context: The base app context
    /// - Returns: Dictionary of additional data as FunctionalityArgumentValue
    func resolveData(for functionality: Functionality, context: AppContext) -> [String: FunctionalityArgumentValue]
}
