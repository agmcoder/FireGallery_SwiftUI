# FireGallery_SwiftUI

A SwiftUI photo gallery app backed by **Firebase Storage**.

## Features

- Upload/browse images stored in Firebase Storage (`FirebaseStorageService`, `FirebaseStorageRepository`)
- Grid-based image gallery (`ImagesContainer`, `MainView` / `MainViewModel`)
- Unit and UI test targets

## Tech stack

Swift · SwiftUI · Firebase Storage · MVVM

## Project structure

```
FireGallery_SwiftUI/
├── Delegate/           # AppDelegate (Firebase setup)
├── Model/               # ImageItem
├── Repository/          # FirebaseStorageRepository
├── Service/              # FirebaseStorageService
└── View&ViewModel/Main/ # Gallery UI
```
