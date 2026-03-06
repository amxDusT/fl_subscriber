# SubTrack

SubTrack is a Flutter app to track recurring subscriptions, get payment reminders, and view simple spending analytics. The UI is inspired by the Trade Republic app (minimal, monochrome, bottom-sheet driven), and the codebase follows Clean Architecture (domain → data → presentation).

## Features
- Add subscriptions via a guided bottom-sheet wizard (catalog + custom services)
- Track billing frequency, start date, optional payment alerts
- All data stored locally on device 
- Subscription details with cancellation link support
- Analytics view derived from saved subscriptions

## Demo

[![SubTrack Demo](https://img.youtube.com/vi/VXkAAuCu6qk/0.jpg)](https://youtube.com/shorts/VXkAAuCu6qk?is=I2WaWr6UjgS-td6I)

## Tech stack
- Flutter
- State: Riverpod
- Navigation: GoRouter
- Local DB: Drift
- Notifications: flutter_local_notifications