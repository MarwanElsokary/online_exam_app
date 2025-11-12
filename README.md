🧠 Online Exam — Clean Architecture Based Assessment App

A modern Flutter application built to simplify and digitize the exam experience for both students and instructors.
The app is structured with Clean Architecture, ensuring scalability, maintainability, and clean separation of concerns.








📘 Overview

Online Exam App is a digital platform designed for educational institutions and e-learning environments.
Teachers can create and publish exams, while students can attend, submit, and view their scores instantly.
The app follows Clean Architecture principles and integrates robust state management, dependency injection, and error handling.

📱 Features

🔐 User authentication (Login / Register)

👩‍🏫 Two main roles — Instructor & Student

🧩 Create, edit, and delete exams

❓ Add multiple-choice questions dynamically

⏱️ Timed exams with automatic submission

📊 Real-time result calculation and feedback

🌐 Offline-first architecture with local caching

💉 Dependency Injection (get_it, injectable)

🌍 Networking via Dio + Retrofit

⚙️ State management using Bloc / Cubit

🧠 Functional programming with dartz

🧱 Clean Architecture (Data, Domain, Presentation layers)

🧠 Tech Stack

Frontend: Flutter (Dart)

Architecture: Clean Architecture

Networking: Dio + Retrofit

Dependency Injection: get_it + injectable

State Management: Bloc / Cubit

Functional Programming: dartz

Local Storage: SharedPreferences

Connectivity: connectivity_plus

Logging: logger + pretty_dio_logger

🚀 Getting Started
Prerequisites

Flutter SDK (>=3.0)

Android Studio / VS Code

Emulator or physical device

Installation

Clone the repository:

git clone https://github.com/MarwanElsokary/Online-Exam.git


Navigate to the project directory:

cd online_exam


Install dependencies:

flutter pub get


Run code generation:

flutter pub run build_runner build --delete-conflicting-outputs


Run the app:

flutter run

🤝 Contributing

Fork the repo

Create your feature branch (git checkout -b feature/YourFeature)

Commit changes (git commit -m 'Add some feature')

Push to branch (git push origin feature/YourFeature)

Open a Pull Request

👨‍💻 Author

Marwan Yasser ElSokary
Flutter Developer
GitHub Profile

🧩 Online Exam — Making assessments smarter, faster, and fairer.
