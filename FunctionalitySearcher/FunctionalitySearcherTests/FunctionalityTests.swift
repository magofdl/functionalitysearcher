import XCTest
@testable import FunctionalitySearcher

final class FunctionalityTests: XCTestCase {
    
    func testFunctionalityInitialization() {
        let functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test Functionality",
            path: "/test/001",
            category: "Test",
            description: "Test description",
            keywords: ["test", "functionality"],
            uiType: .uikit
        )
        
        XCTAssertEqual(functionality.id, "TEST_001")
        XCTAssertEqual(functionality.code, "TEST_001")
        XCTAssertEqual(functionality.name, "Test Functionality")
        XCTAssertEqual(functionality.path, "/test/001")
        XCTAssertEqual(functionality.category, "Test")
        XCTAssertEqual(functionality.description, "Test description")
        XCTAssertEqual(functionality.keywords, ["test", "functionality"])
        XCTAssertEqual(functionality.uiType, .uikit)
        XCTAssertTrue(functionality.arguments.isEmpty)
    }
    
    func testFunctionalityWithArguments() {
        let arguments: [String: FunctionalityArgumentValue] = [
            "key1": .string("value1"),
            "key2": .int(42)
        ]
        
        let functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit,
            arguments: arguments
        )
        
        XCTAssertEqual(functionality.arguments.count, 2)
        XCTAssertEqual(functionality.arguments["key1"]?.stringValue, "value1")
        XCTAssertEqual(functionality.arguments["key2"]?.intValue, 42)
    }
    
    func testFunctionalityDefaultArguments() {
        let functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .swiftui
        )
        
        XCTAssertTrue(functionality.arguments.isEmpty)
    }
    
    func testFunctionalityCodable() throws {
        let functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: ["test"],
            uiType: .uikit
        )
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(functionality)
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Functionality.self, from: data)
        
        XCTAssertEqual(decoded.id, functionality.id)
        XCTAssertEqual(decoded.code, functionality.code)
        XCTAssertEqual(decoded.name, functionality.name)
        XCTAssertEqual(decoded.uiType, functionality.uiType)
    }
    
    func testFunctionalityHashable() {
        let functionality1 = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        let functionality2 = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        XCTAssertEqual(functionality1.hashValue, functionality2.hashValue)
    }
    
    func testFunctionalityIdentifiable() {
        let functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        XCTAssertEqual(functionality.id, functionality.id)
    }
}
