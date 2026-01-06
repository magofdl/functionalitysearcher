import XCTest
@testable import FunctionalitySearcher

final class FunctionalityDataProviderTests: XCTestCase {
    
    func testGenerateMockFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        
        XCTAssertFalse(functionalities.isEmpty)
    }
    
    func testBillingFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let billingFunctionalities = functionalities.filter { $0.category == "Billing" }
        
        XCTAssertEqual(billingFunctionalities.count, 20)
        
        let uikitCount = billingFunctionalities.filter { $0.uiType == .uikit }.count
        let swiftuiCount = billingFunctionalities.filter { $0.uiType == .swiftui }.count
        
        XCTAssertEqual(uikitCount, 10)
        XCTAssertEqual(swiftuiCount, 10)
    }
    
    func testReturnsFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let returnsFunctionalities = functionalities.filter { $0.category == "Returns" }
        
        XCTAssertEqual(returnsFunctionalities.count, 15)
    }
    
    func testCertificatesFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let certificatesFunctionalities = functionalities.filter { $0.category == "Certificates" }
        
        XCTAssertEqual(certificatesFunctionalities.count, 10)
    }
    
    func testProfileFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let profileFunctionalities = functionalities.filter { $0.category == "Profile" }
        
        XCTAssertEqual(profileFunctionalities.count, 17)
    }
    
    func testProductsFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let productsFunctionalities = functionalities.filter { $0.category == "Products" }
        
        XCTAssertEqual(productsFunctionalities.count, 20)
    }
    
    func testOrdersFunctionalities() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let ordersFunctionalities = functionalities.filter { $0.category == "Orders" }
        
        XCTAssertEqual(ordersFunctionalities.count, 20)
    }
    
    func testAllFunctionalitiesHaveUniqueCodes() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        let codes = functionalities.map { $0.code }
        let uniqueCodes = Set(codes)
        
        XCTAssertEqual(codes.count, uniqueCodes.count, "All functionality codes should be unique")
    }
    
    func testAllFunctionalitiesHaveEmptyArguments() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        
        for functionality in functionalities {
            XCTAssertTrue(functionality.arguments.isEmpty, "Functionality \(functionality.code) should have empty arguments")
        }
    }
    
    func testFunctionalityCodesFormat() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        
        for functionality in functionalities {
            XCTAssertTrue(
                functionality.code.contains("_"),
                "Code should contain underscore: \(functionality.code)"
            )
            XCTAssertFalse(
                functionality.code.isEmpty,
                "Code should not be empty: \(functionality.code)"
            )
        }
    }
    
    func testFunctionalityKeywords() {
        let functionalities = FunctionalityDataProvider.generateMockFunctionalities()
        
        for functionality in functionalities {
            XCTAssertFalse(
                functionality.keywords.isEmpty,
                "Functionality \(functionality.code) should have keywords"
            )
        }
    }
}
