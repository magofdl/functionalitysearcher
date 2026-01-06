import XCTest
@testable import FunctionalitySearcher

final class FunctionalityArgumentValueTests: XCTestCase {
    
    func testStringValue() {
        let value = FunctionalityArgumentValue.string("test")
        XCTAssertEqual(value.stringValue, "test")
        XCTAssertNil(value.intValue)
        XCTAssertNil(value.doubleValue)
        XCTAssertNil(value.boolValue)
    }
    
    func testIntValue() {
        let value = FunctionalityArgumentValue.int(42)
        XCTAssertEqual(value.intValue, 42)
        XCTAssertNil(value.stringValue)
        XCTAssertNil(value.doubleValue)
    }
    
    func testDoubleValue() throws {
        let value = FunctionalityArgumentValue.double(3.14)
        let unwrappedValue = try XCTUnwrap(value.doubleValue)
        XCTAssertEqual(unwrappedValue, 3.14, accuracy: 0.001)
        XCTAssertNil(value.intValue)
    }
    
    func testBoolValue() {
        let valueTrue = FunctionalityArgumentValue.bool(true)
        let valueFalse = FunctionalityArgumentValue.bool(false)
        
        XCTAssertEqual(valueTrue.boolValue, true)
        XCTAssertEqual(valueFalse.boolValue, false)
    }
    
    func testDictionaryValue() {
        let dict: [String: FunctionalityArgumentValue] = [
            "key1": .string("value1"),
            "key2": .int(123)
        ]
        let value = FunctionalityArgumentValue.dictionary(dict)
        
        XCTAssertNotNil(value.dictionaryValue)
        XCTAssertEqual(value.dictionaryValue?["key1"]?.stringValue, "value1")
        XCTAssertEqual(value.dictionaryValue?["key2"]?.intValue, 123)
    }
    
    func testArrayValue() {
        let array: [FunctionalityArgumentValue] = [
            .string("item1"),
            .int(42),
            .bool(true)
        ]
        let value = FunctionalityArgumentValue.array(array)
        
        XCTAssertNotNil(value.arrayValue)
        XCTAssertEqual(value.arrayValue?.count, 3)
        XCTAssertEqual(value.arrayValue?[0].stringValue, "item1")
        XCTAssertEqual(value.arrayValue?[1].intValue, 42)
        XCTAssertEqual(value.arrayValue?[2].boolValue, true)
    }
    
    func testNullValue() {
        let value = FunctionalityArgumentValue.null
        XCTAssertNil(value.stringValue)
        XCTAssertNil(value.intValue)
        XCTAssertNil(value.doubleValue)
        XCTAssertNil(value.boolValue)
        XCTAssertNil(value.dictionaryValue)
        XCTAssertNil(value.arrayValue)
    }
    
    func testConvenienceInitializers() throws {
        let stringValue = FunctionalityArgumentValue("test")
        XCTAssertEqual(stringValue.stringValue, "test")
        
        let intValue = FunctionalityArgumentValue(42)
        XCTAssertEqual(intValue.intValue, 42)
        
        let doubleValue = FunctionalityArgumentValue(3.14)
        let unwrappedValue = try XCTUnwrap(doubleValue.doubleValue)
        XCTAssertEqual(unwrappedValue, 3.14, accuracy: 0.001)
        
        let boolValue = FunctionalityArgumentValue(true)
        XCTAssertEqual(boolValue.boolValue, true)
    }
    
    func testCodableEncoding() throws {
        let value = FunctionalityArgumentValue.string("test")
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        
        XCTAssertNotNil(data)
        XCTAssertGreaterThan(data.count, 0)
    }
    
    func testCodableDecoding() throws {
        let originalValue = FunctionalityArgumentValue.string("test")
        let encoder = JSONEncoder()
        let data = try encoder.encode(originalValue)
        
        let decoder = JSONDecoder()
        let decodedValue = try decoder.decode(FunctionalityArgumentValue.self, from: data)
        
        XCTAssertEqual(decodedValue.stringValue, "test")
    }
    
    func testCodableRoundTrip() throws {
        let values: [FunctionalityArgumentValue] = [
            .string("test"),
            .int(42),
            .double(3.14),
            .bool(true),
            .dictionary(["key": .string("value")]),
            .array([.string("item1"), .int(123)]),
            .null
        ]
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        for originalValue in values {
            let data = try encoder.encode(originalValue)
            let decodedValue = try decoder.decode(FunctionalityArgumentValue.self, from: data)
            
            switch (originalValue, decodedValue) {
            case (.string(let original), .string(let decoded)):
                XCTAssertEqual(original, decoded)
            case (.int(let original), .int(let decoded)):
                XCTAssertEqual(original, decoded)
            case (.double(let original), .double(let decoded)):
                XCTAssertEqual(original, decoded, accuracy: 0.001)
            case (.bool(let original), .bool(let decoded)):
                XCTAssertEqual(original, decoded)
            case (.dictionary(let original), .dictionary(let decoded)):
                XCTAssertEqual(original.count, decoded.count)
                for (key, value) in original {
                    XCTAssertNotNil(decoded[key])
                }
            case (.array(let original), .array(let decoded)):
                XCTAssertEqual(original.count, decoded.count)
            case (.null, .null):
                XCTAssertTrue(true)
            default:
                XCTFail("Decoded value doesn't match original 2: \(originalValue) vs \(decodedValue)")
            }
        }
    }
    
    func testHashable() {
        let value1 = FunctionalityArgumentValue.string("test")
        let value2 = FunctionalityArgumentValue.string("test")
        let value3 = FunctionalityArgumentValue.string("different")
        
        XCTAssertEqual(value1.hashValue, value2.hashValue)
        XCTAssertNotEqual(value1.hashValue, value3.hashValue)
    }
    
    func testNestedDictionary() {
        let nestedDict: [String: FunctionalityArgumentValue] = [
            "level1": .dictionary([
                "level2": .string("value")
            ])
        ]
        let value = FunctionalityArgumentValue.dictionary(nestedDict)
        
        XCTAssertNotNil(value.dictionaryValue)
        let level1 = value.dictionaryValue?["level1"]?.dictionaryValue
        XCTAssertNotNil(level1)
        XCTAssertEqual(level1?["level2"]?.stringValue, "value")
    }
    
    func testNestedArray() {
        let nestedArray: [FunctionalityArgumentValue] = [
            .array([.string("nested1"), .string("nested2")])
        ]
        let value = FunctionalityArgumentValue.array(nestedArray)
        
        XCTAssertNotNil(value.arrayValue)
        let innerArray = value.arrayValue?[0].arrayValue
        XCTAssertNotNil(innerArray)
        XCTAssertEqual(innerArray?.count, 2)
    }
}
