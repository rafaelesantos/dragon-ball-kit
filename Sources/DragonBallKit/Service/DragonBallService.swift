import Foundation

final class DragonBallService {
    static let shared = DragonBallService()
    
    func makeRequest<T: Codable>(
        for endpoint: DragonBallEndpoint,
        type: T.Type,
        completion: @escaping (Result<T, DragonBallError>) -> Void
    ) {
        guard let url = endpoint.url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return completion(.failure(.serverError)) }
            guard let decoded = try? JSONDecoder().decode(type, from: data) else { return completion(.failure(.decoded)) }
            completion(.success(decoded))
        }.resume()
    }
    
    func makeRequest<T: Codable>(
        for endpoint: String,
        type: T.Type,
        completion: @escaping (Result<T, DragonBallError>) -> Void
    ) {
        guard let url = URL(string: endpoint) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return completion(.failure(.serverError)) }
            guard let decoded = try? JSONDecoder().decode(type, from: data) else { return completion(.failure(.decoded)) }
            completion(.success(decoded))
        }.resume()
    }
}
