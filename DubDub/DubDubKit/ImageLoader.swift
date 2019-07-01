//
//  ImageLoader.swift
//  DubDubKit
//
//  Created by Adolfo Vera Blasco on 27/06/2019.
//  Copyright © 2019 Adolfo Vera Blasco. All rights reserved.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

import SwiftUI
import Combine
import Foundation

public class ImageLoader: BindableObject
{
    ///
    private var imageURL: URL

    /// Las colecciones disponibles en este momento.
    public private(set) var imageData: Data?
    {
        didSet
        {
            self.didChange.send()
        }
    }

    #if os(macOS)
    /// La `NSImage` a partir de los datos recibidos
    public var image: NSImage?
    {
        return NSImage(data: self.imageData)
    }
    #else
    /// La `UIImage` a partir de los datos recibidos
    public var image: UIImage?
    {
        guard let data = self.imageData else
        {
            return nil
        }
        
        return UIImage(data: data)
    }
    #endif

    // MARK: - Bindable Object Protocol -

    /// Informamos de los cambios a la vista.
    public var didChange = PassthroughSubject<Void, Never>()

    /**

    */
    public init(from url: URL)
    {
        print(url)
        self.imageURL = url
    }

    //
    // MARK: - Operations - 
    //

    public func requestImage() -> Void
    {
        let imageTask = URLSession.shared.dataTask(with: self.imageURL) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            DispatchQueue.main.async
            {
                self.imageData = data
            }
        }

        imageTask.resume()
    }
}
