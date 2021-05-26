import Alamofire
import Foundation
import PayseraCommonSDK

public class MokejimaiApiClientFactory {
    public static func createTransferApiClient(
        headers: PSRequestHeaders,
        credentials: PSApiJWTCredentials,
        tokenRefresher: PSTokenRefresherProtocol? = nil,
        logger: PSLoggerProtocol? = nil,
        configure: ((URLSessionConfiguration) -> Void)? = nil
    ) -> MokejimaiApiClient {
        let interceptor = PSRequestAdapter(credentials: credentials, headers: headers)
        let session = Session(interceptor: interceptor)
        configure?(session.sessionConfiguration)
        
        return MokejimaiApiClient(
            session: session,
            credentials: credentials,
            tokenRefresher: tokenRefresher,
            logger: logger
        )
    }
}
