import Foundation

struct FunctionalityDataProvider {
    static func generateMockFunctionalities() -> [Functionality] {
        var functionalities: [Functionality] = []
        
        functionalities.append(contentsOf: generateBillingFunctionalities())
        functionalities.append(contentsOf: generateReturnsFunctionalities())
        functionalities.append(contentsOf: generateCertificatesFunctionalities())
        functionalities.append(contentsOf: generateProfileFunctionalities())
        functionalities.append(contentsOf: generateProductsFunctionalities())
        functionalities.append(contentsOf: generateOrdersFunctionalities())
        
        return functionalities
    }
    
    private static func generateBillingFunctionalities() -> [Functionality] {
        let baseKeywords = ["billing", "invoice", "receipt", "payment", "bill", "charge"]
        var functionalities: [Functionality] = []
        
        let names = [
            "Download invoice",
            "View invoice history",
            "Monthly billing",
            "Export invoices",
            "Search invoice by number",
            "Pending invoices",
            "Payment receipts",
            "Account statements",
            "Annual billing",
            "Billing summary",
            "Download electronic invoice",
            "View invoice details",
            "Overdue invoices",
            "Generate receipt",
            "Payment history",
            "Billing by period",
            "Check balance",
            "Invoices by category",
            "Download all invoices",
            "Configure billing"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index % 2 == 0 ? .uikit : .swiftui
            let code = "BILL_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/billing/\(index + 1)",
                category: "Billing",
                description: "\(name) - Billing functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
    
    private static func generateReturnsFunctionalities() -> [Functionality] {
        let baseKeywords = ["return", "refund", "exchange", "send back", "reimbursement"]
        var functionalities: [Functionality] = []
        
        let names = [
            "Initiate return",
            "Track return",
            "Return status",
            "Return history",
            "Quick return",
            "Request refund",
            "Cancel return",
            "Partial return",
            "View return policy",
            "Return by defect",
            "Return process",
            "In-store return",
            "Return by mail",
            "Return timeline",
            "Return completed"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index < 8 ? .uikit : .swiftui
            let code = "RET_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/returns/\(index + 1)",
                category: "Returns",
                description: "\(name) - Return functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
    
    private static func generateCertificatesFunctionalities() -> [Functionality] {
        let baseKeywords = ["certificate", "document", "accreditation", "credential", "diploma"]
        var functionalities: [Functionality] = []
        
        let names = [
            "Get certificate",
            "Renew certificate",
            "Download certificate",
            "View active certificates",
            "Digital certificate",
            "Validate certificate",
            "Certificate of origin",
            "Export certificate",
            "Certificate history",
            "Certificates by category"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index % 2 == 0 ? .uikit : .swiftui
            let code = "CERT_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/certificates/\(index + 1)",
                category: "Certificates",
                description: "\(name) - Certificate functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
    
    private static func generateProfileFunctionalities() -> [Functionality] {
        let baseKeywords = ["profile", "account", "user", "settings", "preferences", "personal"]
        var functionalities: [Functionality] = []
        
        let names = [
            "Edit profile",
            "Change password",
            "View personal information",
            "Configure notifications",
            "Privacy preferences",
            "Manage addresses",
            "Payment cards",
            "Activity history",
            "Account settings",
            "Edit profile photo",
            "Verify email",
            "Configure security",
            "Payment methods",
            "Delete account",
            "Export data"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index < 7 ? .uikit : .swiftui
            let code = "PROF_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/profile/\(index + 1)",
                category: "Profile",
                description: "\(name) - Profile functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
    
    private static func generateProductsFunctionalities() -> [Functionality] {
        let baseKeywords = ["product", "catalog", "item", "merchandise", "goods"]
        var functionalities: [Functionality] = []
        
        let names = [
            "Search products",
            "View product details",
            "Compare products",
            "Favorites",
            "Product categories",
            "Featured products",
            "Special offers",
            "Review product",
            "Related products",
            "Technical specifications",
            "Image gallery",
            "Stock availability",
            "Prices and discounts",
            "Similar products",
            "Recently viewed products",
            "Filter products",
            "Sort products",
            "List view",
            "Grid view",
            "Recent products"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index % 2 == 0 ? .uikit : .swiftui
            let code = "PROD_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/products/\(index + 1)",
                category: "Products",
                description: "\(name) - Product functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
    
    private static func generateOrdersFunctionalities() -> [Functionality] {
        let baseKeywords = ["order", "purchase", "shipping", "delivery", "tracking"]
        var functionalities: [Functionality] = []
        
        let names = [
            "View orders",
            "Track shipment",
            "Order details",
            "Order history",
            "Cancel order",
            "Reorder",
            "Order status",
            "Update shipping address",
            "Rate order",
            "Pending orders",
            "Completed orders",
            "Order timeline",
            "Shipping information",
            "Modify order",
            "Receive order notifications",
            "Orders by date",
            "Orders by status",
            "Export orders",
            "Order invoice details",
            "Contact about order"
        ]
        
        for (index, name) in names.enumerated() {
            let uiType: UIType = index % 2 == 0 ? .uikit : .swiftui
            let code = "ORD_\(String(format: "%03d", index + 1))"
            
            functionalities.append(Functionality(
                id: code,
                code: code,
                name: name,
                path: "/orders/\(index + 1)",
                category: "Orders",
                description: "\(name) - Order functionality",
                keywords: baseKeywords + name.lowercased().components(separatedBy: " "),
                uiType: uiType
            ))
        }
        
        return functionalities
    }
}
