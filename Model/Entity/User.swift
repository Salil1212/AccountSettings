import Foundation
import JSONParsing
public final class User: JSONParseable {
    
    // MARK: - Properties
    
    public var token: String
    public var isKycDone: Bool
    public var username: String
    public var phone: String
    public var email: String
    
    // Additional fields
    public var minimumWashCommitment: Int
    public var taxableAmount: Double
    public var cgst: Double
    public var sgst: Double
    
    
    // MARK: - Initialization
    
    init(token: String, isKycDone: Bool, username: String, phone: String, email: String,
         minimumWashCommitment: Int, taxableAmount: Double, cgst: Double, sgst: Double
    ) {
        self.token = token
        self.isKycDone = isKycDone
        self.username = username
        self.phone = phone
        self.email = email
        self.minimumWashCommitment = minimumWashCommitment
        self.taxableAmount = taxableAmount
        self.cgst = cgst
        self.sgst = sgst
    }
        
    
    // MARK: - JSONParseable
    
    public static func parse(_ json: JSON) throws -> User {
        return User(
            token: json["user"]["userId"]^!,
            isKycDone: json["user"]["isKycDone"]^!,
            username: json["user"]["username"]^!,
            phone: json["user"]["phone"]^!,
            email: json["user"]["email"]^!,
            minimumWashCommitment: json["user"]["minimumWashCommitme"]^!,
            taxableAmount: json["user"]["taxableAmount"]^!,
            cgst: json["user"]["cgst"]^!,
            sgst: json["user"]["sgst"]^!
            
        )
    }
}
