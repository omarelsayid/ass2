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


<img width="632" height="640" alt="image" src="https://github.com/user-attachments/assets/7218d08a-e5e7-4ec0-9072-362dd47f4893" />



https://github.com/user-attachments/assets/1e297419-f4d6-44ce-9d95-3b33010e3b02




