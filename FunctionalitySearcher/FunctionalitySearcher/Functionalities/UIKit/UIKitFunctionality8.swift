import UIKit

class UIKitFunctionality8: IndependentFunctionalityViewController {
    private let userId: String
    
    init(functionality: Functionality, userId: String, onDismiss: @escaping () -> Void) {
        self.userId = userId
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
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = true
        
        let switchLabel = UILabel()
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.text = "UIKit Switch"
        switchLabel.font = .systemFont(ofSize: 16)
        
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.value = 50
        
        let stepperLabel = UILabel()
        stepperLabel.translatesAutoresizingMaskIntoConstraints = false
        stepperLabel.text = "UIKit Stepper"
        stepperLabel.font = .systemFont(ofSize: 16)
        
        view.addSubview(switchControl)
        view.addSubview(switchLabel)
        view.addSubview(stepper)
        view.addSubview(stepperLabel)
        
        NSLayoutConstraint.activate([
            switchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            switchControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchControl.topAnchor.constraint(equalTo: switchLabel.bottomAnchor, constant: 20),
            
            stepperLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepperLabel.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 40),
            
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.topAnchor.constraint(equalTo: stepperLabel.bottomAnchor, constant: 20)
        ])
    }
}
