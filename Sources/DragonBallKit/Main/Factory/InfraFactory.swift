import Foundation
import RefdsNetwork
import RefdsInjection

class InfraFactory {
    static func registerDependencies() {
        RefdsContainer.register(type: RefdsHttpClient.self) { RefdsHttpNetworkAdapter() }
    }
}
