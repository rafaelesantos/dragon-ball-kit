import Foundation
import RefdsShared
import RefdsNetwork

public enum DragonBallKitError: RefdsAlert {
    case appNeedUpdate
    case serverError
    case noConnectivity
    
    init(httpError: RefdsHttpError) {
        switch httpError {
        case .noConnectivity: self = .noConnectivity
        case .serverError: self = .serverError
        default: self = .appNeedUpdate
        }
    }
    
    public var title: String? {
        switch self {
        case .appNeedUpdate: return "Incomplete Kamehameha!"
        case .serverError: return "Vegeta's Assault!"
        case .noConnectivity: return "Training at Karin's Tower"
        }
    }
    
    public var message: String? {
        switch self {
        case .appNeedUpdate:
            return "The power of the Kamehameha is immense, but it seems like your app version isn't updated to handle such energy! Perform an update to unlock all the power and access the latest features in our Dragon Ball world."
        case .serverError:
            return "Our server seems to be under a powerful assault from the Prince of Saiyans! We're working hard to overcome this barrier and restore peace in our Dragon Ball universe. Please be patient and try again soon."
        case .noConnectivity:
            return "You're temporarily disconnected from the flow of ki! Just like Goku climbing Karin's Tower in search of improvement, check your network connection to resume your journey. Once restored, you'll be ready to face any challenge in our Dragon Ball world!"
        }
    }
}
