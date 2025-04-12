# PulseBoard - Sensor Analytics Dashboard

PulseBoard is a Flutter web application that visualizes real-time sensor data in a responsive and interactive dashboard. It provides charts, alerts, raw data, and simulation controls to emulate various sensor behaviors.

Pulse Web URL: https://ranveersingh1997.github.io/pulse_board/
---

##  Getting Started

### Run the Project

Ensure Flutter is installed and you’re using a compatible version (Flutter 3.29+ recommended). Then run the app in Chrome:

```bash```
```flutter run -d chrome```


### Runnning Test  cases

To execute all available unit and widget tests, use the following command:

```bash```
```flutter test```

```
lib/
│
|-- approute
├── application/           # Riverpod providers and application-level logic
│   └── providers/         # State management for sensors, metrics, and simulations
├── core/                  # DI setup and other core services/utilities
│   └── di/                # GetIt dependency injection configuration
├── data/                  
│   ├── model/             # Data models (Sensor, Simulation, Details) with Freezed
│   └── repo/              # Repository interfaces and mock implementations
|   |__ service/           # Data service class for providing mock data 
├── presentation/          # UI layer (pages, widgets, charts)
│   ├── charts/            # Line charts and anomaly timelines
│   ├── common/            # Shared widgets (e.g., ResponsiveWidget)
│   └── pages/             
│       └── detail/        # Detailed view of a selected sensor (modular widgets)
|       |__ dashboard/
|       |__ settings/  
├── shared/                # App-wide constants, enums, and helpers
└── main.dart              # Entry point with routing setup using AutoRoute

```

# Design Highlights 

-> Riverpod: State management using StateProvider, StateNotifierProvider, and FutureProvider for flexibility and testability.

-> AutoRoute: Declarative routing with automatic code generation for cleaner navigation.

-> Freezed: Immutable data models with union types and copyWith support.

-> Responsive UI: Built with custom ResponsiveWidget to adapt across mobile, tablet, and desktop screens.

-> Testable Architecture: Business logic and UI components are modular and test-covered.
 
### Project Screenshot and Recording

Dashboard Page

<img width="1440" alt="Screenshot 2025-04-12 at 9 01 41 PM" src="https://github.com/user-attachments/assets/fc9bdbea-85f8-4571-8e80-d27e8db4d846" />

Settings Page

<img width="1440" alt="Screenshot 2025-04-12 at 9 01 48 PM" src="https://github.com/user-attachments/assets/8a5fcabf-c82f-4e7e-a045-d479e2716894" />

Details Page

<img width="1440" alt="Screenshot 2025-04-12 at 9 02 00 PM" src="https://github.com/user-attachments/assets/0770eba9-4b2e-4e73-8052-268e17d6ddf8" />

<img width="1440" alt="Screenshot 2025-04-12 at 9 02 06 PM" src="https://github.com/user-attachments/assets/9bc6976a-b7d7-4660-b8c4-036d39b2c1ea" />

<img width="1440" alt="Screenshot 2025-04-12 at 9 02 12 PM" src="https://github.com/user-attachments/assets/5cb5e2cd-7899-42fb-b5b2-c3022f99080e" />






