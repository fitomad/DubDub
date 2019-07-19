//
//  CollectionViewModel.swift
//  DubDub
//
//  Created by Adolfo Vera Blasco on 29/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

import CoreWWDC
import DubDubKit

import Foundation

internal class CollectionViewModel: BindableObject
{
    /// Las colecciones disponibles en este momento.
    public private(set) var sessions: [Session]
    {
        willSet
        {
            self.willChange.send()
        }
    }
    
    // MARK: - Bindable Object Protocol -
    
    /// Informamos de los cambios a la vista.
    public var willChange = PassthroughSubject<Void, Never>()

    /**
     
     */
    public init(sessionsTitled sectionNames: [String])
    {
        self.sessions = []
        self.fetchSessions(for: sectionNames)
    }
    
    //
    // MARK: - Operations -
    //
    
    private func fetchSessions(for sessionsNames: [String]) -> Void
    {
        WWDCClient.shared.requestSessions() { (result: Result<[Session], WWDCError>) -> Void in
            switch result
            {
            case .success(let sessions):
                
                DispatchQueue.main.async
                {
                    self.sessions = sessions.filter({ sessionsNames.contains($0.title) })
                }
                
            case .failure(let error):
                DispatchQueue.main.async
                {
                    self.sessions = []
                }
                
                print("Problemas al recuperar las sesiones. \(error)")
            }
        }
    }
}
