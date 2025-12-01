# 🔄 CHANGE - Change Order Management System

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Google Apps Script](https://img.shields.io/badge/Google_Apps_Script-4285F4?style=for-the-badge&logo=google&logoColor=white)

**A comprehensive Flutter application for managing contract change orders with real-time currency exchange rates and document management.**

[Features](#-features) •
[Tech Stack](#-tech-stack) •
[Getting Started](#-getting-started) •
[Architecture](#-architecture) •
[Contributing](#-contributing)

</div>

---

## 📸 Screenshots

> *Screenshots coming soon*

---

## ✨ Features

### 📋 Change Order Management
- Create, edit, and track contract change orders
- Multi-level approval workflow (Level I-IV)
- Category-based classification (Category A-E)
- Automatic calculation of contract extensions

### 💱 Real-Time Currency Exchange
- **EUR/COP** - Euro to Colombian Peso rates
- **USD/COP** - US Dollar to Colombian Peso rates
- Automatic currency conversions for contract amounts

### 📊 Data Management
- **GM (Material Groups)** - Search and browse material groups with risk classifications
- Contract supplier information management
- Historical tracking of change order statuses

### 🔐 Authentication & Security
- Firebase Authentication (Email/Password)
- Email verification required
- Secure credential management via environment variables

### 📁 Document Management
- File upload to Google Drive
- Support for multiple file formats
- Organized folder structure by project

### 🎨 User Experience
- Dark/Light theme support
- Customizable color schemes
- Material Design 3 (Material You)
- Responsive design for web and mobile

---

## 🛠 Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter 3.7+ |
| **Language** | Dart |
| **State Management** | BLoC Pattern |
| **Authentication** | Firebase Auth |
| **Backend** | Google Apps Script |
| **Storage** | Google Drive API |
| **Local Storage** | LocalStorage |

### Dependencies

```yaml
flutter_bloc: ^9.1.0      # State management
firebase_auth: ^5.5.2     # Authentication
firebase_core: ^3.13.0    # Firebase core
http: ^1.3.0              # HTTP requests
flutter_dotenv: ^5.2.1    # Environment variables
file_picker: ^10.1.2      # File selection
printing: ^5.10.4         # PDF generation
intl: ^0.20.2             # Internationalization
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.7.2
- Dart SDK
- Firebase account
- Google Cloud account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jozzer182/CHANGE.git
   cd CHANGE
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` with your credentials:
   ```env
   FIREBASE_API_KEY=your_api_key
   FIREBASE_APP_ID=your_app_id
   # ... see .env.example for all variables
   ```

4. **Run the application**
   ```bash
   # Web
   flutter run -d chrome
   
   # Android
   flutter run -d android
   
   # iOS
   flutter run -d ios
   ```

### Detailed Setup

For detailed configuration instructions including Firebase setup and Google Apps Script deployment, see [docs/SETUP.md](docs/SETUP.md).

---

## 📁 Architecture

```
lib/
├── bloc/                    # BLoC state management
│   ├── main_bloc.dart
│   ├── main_event.dart
│   └── main_state.dart
│
├── changeorder/             # Change Order feature
│   ├── controller/
│   ├── model/
│   └── view/
│
├── eurcop/                  # EUR/COP exchange rates
│   ├── controller/
│   └── model/
│
├── usdcop/                  # USD/COP exchange rates
│   ├── controller/
│   └── model/
│
├── gm/                      # Material Groups
│   ├── controller/
│   ├── model/
│   └── view/
│
├── home/                    # Home page
│   └── home_page.dart
│
├── login/                   # Authentication
│   ├── model/
│   └── view/
│
├── resources/               # Shared utilities
│   ├── env_config.dart      # Environment variables
│   ├── file_uploader.dart
│   └── ...
│
├── user/                    # User management
│   ├── controller/
│   └── model/
│
├── firebase_options.dart    # Firebase configuration
└── main.dart                # Entry point
```

### State Management

The application uses the **BLoC pattern** for state management:
- `MainBloc` handles global application state
- Feature-specific state is managed within each module

### Data Flow

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   Flutter   │────▶│  Google Apps     │────▶│  Google Sheets  │
│     App     │◀────│    Script        │◀────│  (Database)     │
└─────────────┘     └──────────────────┘     └─────────────────┘
       │
       │
       ▼
┌─────────────┐
│  Firebase   │
│    Auth     │
└─────────────┘
```

---

## 🔧 Configuration

### Environment Variables

| Variable | Description |
|----------|-------------|
| `FIREBASE_API_KEY` | Firebase Web API Key |
| `FIREBASE_APP_ID` | Firebase App ID |
| `FIREBASE_MESSAGING_SENDER_ID` | Firebase Cloud Messaging Sender ID |
| `FIREBASE_PROJECT_ID` | Firebase Project ID |
| `FIREBASE_AUTH_DOMAIN` | Firebase Auth Domain |
| `FIREBASE_STORAGE_BUCKET` | Firebase Storage Bucket |
| `FIREBASE_MEASUREMENT_ID` | Google Analytics Measurement ID |
| `API_MAIN_ENDPOINT` | Google Apps Script main API URL |
| `API_FILE_UPLOAD_ENDPOINT` | Google Apps Script file upload URL |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact

**Jorge Zapata** - [@jozzer182](https://github.com/jozzer182)

Project Link: [https://github.com/jozzer182/CHANGE](https://github.com/jozzer182/CHANGE)

---

<div align="center">

**Made with ❤️ using Flutter**

</div>
