
🎓 Online Exam App — Smart Quiz & Assessment Platform
A modern Flutter application built to help students, teachers, and admins manage and take online exams.
The app leverages Firebase for authentication, data storage, and real-time updates, following a Clean Architecture structure.

📝 Overview
Online Exam App is an educational platform connecting students with teachers for taking and managing exams.
Teachers can create exams with multiple question types, students can participate and view results instantly, and admins can oversee users and exams.
The app follows Clean Architecture with Firebase as the backend for a secure, scalable experience.

📱 Features


🔐 Firebase Authentication (login/register by role)


👩‍🎓 Three user roles — Student, Teacher, Admin


📝 Teachers create, edit, and delete exams


⏱️ Timed exams with automatic submission


🧮 Students answer multiple-choice, true/false, and short-answer questions


📊 Instant grading and detailed results


💾 Firebase Firestore & Storage integration


🧱 Clean Architecture (Data, Domain, Presentation layers)


💬 Toasts, responsive UI, and Material Design


🧭 Offline caching with Hive


🔔 Push notifications for new exams and results



🧠 Tech Stack


Frontend: Flutter (Dart)


Backend: Firebase Firestore & Authentication


State Management: Bloc / Cubit


Local Storage: Hive


Networking: Dio


Architecture: Clean Architecture (Domain, Data, Presentation)


Dependency Injection: GetIt



🚀 Getting Started
Prerequisites


Flutter SDK (>=3.0)


Android Studio / VS Code


Firebase project configured (Auth + Firestore)


Emulator or physical device


Installation


Clone the repository:
git clone https://github.com/MarwanElsokary/Online-Exam-App.git



Navigate to the project directory:
cd online_exam_app



Install dependencies:
flutter pub get



Run the app:
flutter run



Testing


Run the app:
flutter test



If Firebase isn’t set up yet, add your configuration files:


android/app/google-services.json


ios/Runner/GoogleService-Info.plist



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


🪄 Online Exam App — empowering education through smart assessments.
