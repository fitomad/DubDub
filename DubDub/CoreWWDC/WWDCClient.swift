//
//  WWDCClient.swift
//  CoreWWDC
//
//  Created by Adolfo Vera Blasco on 29/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import Foundation

public typealias WWDCCompletionHandler<T> = (_ result: Result<T, WWDCError>) -> Void

private typealias HttpCompletionHandler = (_ httpResponse: Result<Data, WWDCError>) -> Void

public class WWDCClient
{
    ///
    public static let shared = WWDCClient()
    
    ///
    private let baseURI: String
    ///
    private let jsonDecoder: JSONDecoder
    ///
    private let httpSession: URLSession
    
    /**
     
     */
    private init()
    {
        self.baseURI = "http://dubdub.desappstre.com/api"
        
        self.jsonDecoder = JSONDecoder()
        
        let httpConfiguration = URLSessionConfiguration.ephemeral
        httpConfiguration.httpMaximumConnectionsPerHost = 5
        
        let httpOperationQueue = OperationQueue()
        httpOperationQueue.maxConcurrentOperationCount = 5
        
        self.httpSession = URLSession(configuration: httpConfiguration, delegate: nil, delegateQueue: httpOperationQueue)
    }
    
    /**
     
     */
    public func requestSpecialCollections(_ handler: @escaping WWDCCompletionHandler<[SpecialCollection]>) -> Void
    {
        let specialsURI = "\(self.baseURI)/special.json"
        
        self.makeHttpRequest(for: specialsURI) { (httpResponse: Result<Data, WWDCError>) -> Void in
            switch httpResponse
            {
                case .success(let data):
                    if let specialCollections = try? self.jsonDecoder.decode([SpecialCollection].self, from: data)
                    {
                        handler(Result.success(specialCollections))
                    }
                    else
                    {
                        handler(Result.failure(WWDCError.documentBadFormat))
                    }
                case .failure(let error):
                    handler(Result.failure(error))
            }
        }
    }
    
    /**
     
     */
    public func requestSessions(_ handler: @escaping WWDCCompletionHandler<[Session]>) -> Void
    {
        let sessionsURI = "\(self.baseURI)/sessions.json"
        
        self.makeHttpRequest(for: sessionsURI) { (httpResponse: Result<Data, WWDCError>) -> Void in
            switch httpResponse
            {
                case .success(let data):
                    if let sessions = try? self.jsonDecoder.decode([Session].self, from: data)
                    {
                        handler(Result.success(sessions))
                    }
                    else
                    {
                        handler(Result.failure(WWDCError.documentBadFormat))
                    }
                
                case .failure(let error):
                    handler(Result.failure(error))
            }
        }
    }
    
    /**
     
    */
    private func makeHttpRequest(for uri: String, completionHandler handler: @escaping HttpCompletionHandler) -> Void
    {
        guard let wwdcURL = URL(string: uri) else
        {
            handler(Result.failure(WWDCError.malformedURL))
            return
        }
        
        let sessionsTask = self.httpSession.dataTask(with: wwdcURL) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data, let httpResponse = response as? HTTPURLResponse else
            {
                handler(Result.failure(WWDCError.badRequest))
                return
            }
            
            switch httpResponse.statusCode
            {
                case 200:
                    handler(Result.success(data))
                case 404:
                    handler(Result.failure(WWDCError.resourceNotFound))
                case 500...599:
                    handler(Result.failure(WWDCError.serverUnavailable))
                default:
                    handler(Result.failure(WWDCError.serverError(code: httpResponse.statusCode)))
            }
            
        }
        
        sessionsTask.resume()
    }
}
