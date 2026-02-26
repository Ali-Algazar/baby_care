# 👶 Baby Care - Mother & Child Companion

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Bloc](https://img.shields.io/badge/bloc-%231A202C.svg?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean_Architecture-Approved-success?style=for-the-badge)

**Baby Care** is a comprehensive, cross-platform mobile application built with Flutter. It serves as a smart companion for parents, helping them track their children's mandatory vaccination schedules, monitor daily growth logs, find nearby pediatricians, and connect with a supportive parenting community.

<img width="100%" alt="baby" src="https://github.com/user-attachments/assets/7a7f4c87-b781-4d59-b1ab-47f007ba23b8" />

---

## 🎯 Problem Statement
Parents often struggle to keep track of complex vaccination schedules and find reliable pediatricians during emergencies. Additionally, searching for trusted parenting advice often leads to fragmented and unreliable sources. **Baby Care** solves this by centralizing healthcare tracking, geo-location services, and a supportive community into one intuitive mobile experience.

---

## ✨ App Features & Showcase

Here is a detailed look at the core features of **Baby Care**, designed to provide a seamless experience for parents.

### 💉 1. Smart Vaccination Tracker
Automatically calculates mandatory and optional vaccine due dates based on the child's birth date. It provides timely reminders and medical guidelines for post-vaccination care (e.g., handling fever).

<div align="center">
  <img src="https://github.com/user-attachments/assets/7558a1cc-7f51-4fb9-a837-117222db834b" width="30%">
  &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="https://github.com/user-attachments/assets/98e5297d-0746-4356-8e97-78b168edfa71" width="30%">
</div>
<br>

### 🩺 2. Geo-Spatial Doctor Search
Utilizes device location (GPS) and MongoDB's `2dsphere` index to find and filter nearby pediatricians. Parents can view doctor profiles, working hours, and book directly via WhatsApp.

<div align="center">
  <img src="https://github.com/user-attachments/assets/ab714db1-3b7c-4c24-96af-f957de7a5d9c" width="30%">
  &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="https://github.com/user-attachments/assets/fe080bfd-8596-44fa-b93f-bd2856e898b3" width="30%">
</div>
<br>

### 👨‍👩‍👧‍👦 3. Interactive Parenting Community
A dedicated social feed where parents can share experiences, ask questions, and engage. Features include creating posts with images, liking/disliking, saving posts (Bookmarks), and nested comments.

<div align="center">
  <img src="https://github.com/user-attachments/assets/a60d0709-fbc8-4715-81af-c910c70fcb3c" width="30%">
  &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="https://github.com/user-attachments/assets/b5e00c94-d104-40b5-ab1c-ca4542168082" width="30%">
</div>
<br>

### 📈 4. Growth & Daily Logs
Allows parents to keep track of the baby's physical development (weight, height, head circumference) and record daily activities such as feeding times, diaper changes, and sleep cycles.

<div align="center">
  <img src="https://github.com/user-attachments/assets/ce14e3a9-5415-429d-95ed-80de594c9513" width="30%">
  &nbsp; &nbsp; &nbsp; &nbsp;
  <img src="https://github.com/user-attachments/assets/0859d49e-d945-4ed2-ae51-050d52051126" width="30%">
</div>
<br>

### 🎵 5. Baby Sleep Aids (White Noise)
A built-in background audio player with carefully curated sounds (e.g., rain, hairdryer, heartbeat) proven to soothe colicky babies and help them sleep better.

<div align="center">
  <img src="https://github.com/user-attachments/assets/271cba97-52a5-424f-b7a5-5532c1bcaf9b" width="30%">
</div>
<br>

### 🤖 6. AI Parenting Assistant
A smart chatbot module integrated to provide immediate, context-aware general parenting tips and first-aid guidance during late-night hours.

<div align="center">
  <img src="https://github.com/user-attachments/assets/54496a47-94cb-4ef1-86d6-c605ac870615" width="30%">
</div>

---

## 🛠️ Technical Stack & Architecture

This project strictly follows **Clean Architecture** principles to ensure separation of concerns, scalability, and testability.

* **Framework:** Flutter (Dart)
* **State Management:** Bloc / Cubit
* **Networking:** Dio (with custom Interceptors for JWT token injection and error handling)
* **Dependency Injection:** GetIt
* **Functional Programming:** Dartz (for `Either` and failure handling)
* **Routing:** Flutter Navigator / GoRouter
* **Local Storage:** Hive / Shared Preferences

### 📁 Folder Structure (Clean Architecture)
```text
lib/
 ┣ core/                # Shared utilities, networking, errors, theme
 ┣ features/            # Feature-based modular structure
 ┃ ┣ vaccinations/
 ┃ ┃ ┣ data/            # Models, Data Sources (Remote/Local), Repositories
 ┃ ┃ ┣ domain/          # Entities, Use Cases, Repository Interfaces
 ┃ ┃ ┗ presentation/    # UI (Pages, Widgets), State Management (Bloc/Cubit)
 ┃ ┣ community/
 ┃ ┣ doctors/
 ┃ ┗ auth/
 ┗ main.dart
