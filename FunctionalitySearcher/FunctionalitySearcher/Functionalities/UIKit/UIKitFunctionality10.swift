import UIKit

class UIKitFunctionality10: BaseFunctionalityViewController {
    private let userId: String
    private let userRole: String?
    
    init(functionality: Functionality, userId: String, userRole: String?, onDismiss: @escaping () -> Void) {
        self.userId = userId
        self.userRole = userRole
        super.init(functionality: functionality, onDismiss: onDismiss)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomLayout()
    }
    
    private func setupCustomLayout() {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIKit Date Picker"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        
        contentView.insertSubview(datePicker, at: 0)
        contentView.insertSubview(label, at: 0)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            datePicker.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
