🧠 Online Exam — Smart Examination Management App

A modern Flutter application built using Clean Architecture for managing and conducting online exams efficiently.
The app allows students to take exams, view results, and track performance, while instructors can create and manage exams easily.


📚 Overview

Online Exam App is a platform designed to digitize the examination process.
It enables teachers to create exams, add questions, and manage results, while students can attend exams securely, track their performance, and review answers.
The app follows Clean Architecture principles, ensuring scalability, testability, and separation of concerns.

🎯 Features

🔐 User Authentication (Login / Register)

🧑‍🏫 Two main roles — Instructor & Student

📝 Create, edit, and delete exams

❓ Add multiple choice questions dynamically

⏱️ Timed exams with auto-submit

📊 Result calculation and detailed feedback

🌐 Offline support with local caching

🧱 Clean Architecture (Data, Domain, Presentation)

💉 Dependency Injection with get_it & injectable

🌍 Network handling using Dio + Retrofit

⚙️ State Management with Bloc / Cubit

🧠 Functional programming patterns via dartz

📶 Connectivity awareness with connectivity_plus

💾 Local storage via SharedPreferences

⚙️ Tech Stack
Layer	Tools / Packages
Architecture	Clean Architecture
State Management	Flutter Bloc
Networking	Dio, Retrofit
Dependency Injection	get_it, injectable
Functional Programming	dartz
Caching & Storage	SharedPreferences
Connectivity	connectivity_plus
Logging	logger, pretty_dio_logger
Code Generation	build_runner, json_serializable
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

Fork the repository

Create a new feature branch

git checkout -b feature/YourFeature


Commit changes

git commit -m "Add YourFeature"


Push to branch

git push origin feature/YourFeature


Open a Pull Request

👨‍💻 Author

Marwan Yasser ElSokary
Flutter Developer
GitHub Profile

🧠 Online Exam — Empowering modern learning through technology.
