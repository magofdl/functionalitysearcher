import Foundation

struct Functionality: Codable, Identifiable, Hashable {
    let id: String
    let code: String
    let name: String
    let path: String
    let category: String
    let description: String
    let keywords: [String]
    let uiType: UIType
    let arguments: [String: FunctionalityArgumentValue]
    
    init(id: String, code: String, name: String, path: String, category: String, description: String, keywords: [String], uiType: UIType, arguments: [String: FunctionalityArgumentValue] = [:]) {
        self.id = id
        self.code = code
        self.name = name
        self.path = path
        self.category = category
        self.description = description
        self.keywords = keywords
        self.uiType = uiType
        self.arguments = arguments
    }
}
