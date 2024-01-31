import Foundation

public enum DragonBallError: Error {
    case serverError
    case decoded
    
    var localizedDescription: String {
        switch self {
        case .serverError: return "Oops! It seems that the Dragon Radar is malfunctioning, and we're currently experiencing technical difficulties in retrieving the requested characters. Our team of skilled technicians has been notified and is working tirelessly to fix the issue.\nPlease be patient, as this might take a moment. In the meantime, feel free to explore other areas of the Dragon Ball Z universe. The Saiyans, Namekians, and Androids are on standby to entertain you while our IT Shenron works on restoring order.\nWe apologize for the inconvenience, and thank you for your understanding."
        case .decoded: return "Uh-oh! It appears that you're using an outdated version of our Dragon Ball Z Universe app. To unlock new transformations and access the latest features, you'll need to update to the most recent version.\nPlease visit your app store and download the latest update. Once you've installed it, you'll be ready to embark on exciting quests, encounter new characters, and power up your experience.\nWe apologize for any inconvenience this may cause, but staying up-to-date ensures you have the best Saiyan experience possible.\nThank you for your understanding and continued support!"
        }
    }
}
