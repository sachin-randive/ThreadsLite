//
//  ProfileViewModel.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 03/12/25.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

@MainActor
class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedPhotoItem: PhotosPickerItem? {
        didSet {
            Task{ await self.loadImage()}
        }
    }
    @Published var profileImage: Image?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            DispatchQueue.main.async {
                self?.currentUser = user
            }
            print("Debug: User in view model from combine is \(String(describing: user))")
        }.store(in: &cancellables)
    }
    private func loadImage() async {
        guard let item = selectedPhotoItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
