📝 Flutter Notes App
A simple and clean note-taking app built using Flutter, implementing Bloc for state management, the Repository Pattern, and Hive for local data persistence. The app supports viewing, adding, editing, and deleting notes, with support for dark mode and responsive UI.

✨ Features
✅ Core Features
🏠 Home Screen with a dynamic list of notes (ListView.builder)

➕ Add Note Screen with fields for title and content

✏️ Edit Note support for updating existing notes

🗑️ Delete Note functionality with one tap

🔁 Responsive UI using MediaQuery and adaptive layout

🌙 Theme Switcher for Dark/Light mode

💾 Local Data Storage
📦 sqlite

📌 Notes are saved locally and restored after app restarts

🆔 Each note has a unique id generated using timestamp

📅 Notes are sorted by date (newest first)

🧱 Architecture
The app is structured following Clean Architecture principles:

🔄 State Management
✅ flutter_bloc is used for managing UI and business logic separately.

Cubits handle fetching, adding, editing, and deleting notes.

🗃️ Repository Pattern
NotesRepository abstracts the data layer from the presentation.

Easy to scale or switch to another backend like SQLite or REST API in the future.

🧠 Dependency Injection
Managed using injectable and get_it.
