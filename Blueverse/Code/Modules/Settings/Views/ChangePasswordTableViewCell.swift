
import UIKit

protocol ChangePasswordTableViewCellDelegate: AnyObject {
    func didTapCancelButton(in cell: ChangePasswordTableViewCell)
}
class ChangePasswordTableViewCell: UITableViewCell {
    var currentPassword = ""
    var newPassword = ""
    var confirmPassword = ""
    
    @IBOutlet weak var currntPaswrdtxt: UITextField!
    @IBOutlet weak var newPasswrdtxt: UITextField!
    @IBOutlet weak var cnfirmPasswordtxt: UITextField!
    @IBOutlet weak var eye1: UIButton!
    @IBOutlet weak var eye2: UIButton!
    @IBOutlet weak var eye3: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    weak var delegate: ChangePasswordTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        hidePasswordButtonConfig()
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func updatePassword(_ sender: UIButton) {
        currentPassword = currntPaswrdtxt.text ?? ""
        newPassword = newPasswrdtxt.text ?? ""
        confirmPassword = cnfirmPasswordtxt.text ?? ""
        
        // Additional code to handle password update
    }
    
    func hidePasswordButtonConfig() {
        eye1.setImage(UIImage(named: "hideEye"), for: .normal)
        eye2.setImage(UIImage(named: "hideEye"), for: .normal)
        eye3.setImage(UIImage(named: "hideEye"), for: .normal)
        
        eye1.addTarget(self, action: #selector(hidePasswordButtonTapped(_:)), for: .touchUpInside)
        eye2.addTarget(self, action: #selector(hidePasswordButtonTapped(_:)), for: .touchUpInside)
        eye3.addTarget(self, action: #selector(hidePasswordButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func hidePasswordButtonTapped(_ sender: UIButton) {
        if sender == eye1 {
            currntPaswrdtxt.isSecureTextEntry.toggle()
            let imageName = currntPaswrdtxt.isSecureTextEntry ? "hideEye" : "openEye"
            eye1.setImage(UIImage(named: imageName), for: .normal)
        } else if sender == eye2 {
            newPasswrdtxt.isSecureTextEntry.toggle()
            let imageName = newPasswrdtxt.isSecureTextEntry ? "hideEye" : "openEye"
            eye2.setImage(UIImage(named: imageName), for: .normal)
        } else if sender == eye3 {
            cnfirmPasswordtxt.isSecureTextEntry.toggle()
            let imageName = cnfirmPasswordtxt.isSecureTextEntry ? "hideEye" : "openEye"
            eye3.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    @objc private func cancelButtonTapped() {
        delegate?.didTapCancelButton(in: self)
    }

}
