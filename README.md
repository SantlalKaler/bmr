

# 🌾 BMR - Smart Agriculture Field Workforce Management App

**BMR** is a field tracking and task management application built for teams working in the **agriculture sector**, especially for those involved in **sampling, harvesting, and field inspections**.  
It helps organizations manage, monitor, and analyze their on-ground workforce operations in **real-time**.

---

## 📷 Screenshots

| Check-In | Live Tracking | Task List | Farmer Detail |
|-----------|----------------|------------|----------------|
| ![](screenshots/bmr_ss0.png) | ![](screenshots/bmr_ss1.png) | ![](screenshots/bmr_ss2.png) | ![](screenshots/bmr_ss1.png) |


## 🚀 Key Features

### 🕘 Check-In / Check-Out System
- Users **check in** at the start of their workday and **check out** at the end.  
- **Live GPS tracking** starts automatically after check-in and stops immediately after checkout.  
- Captures **vehicle meter readings** (bike/car) during both check-in and check-out to track daily travel distance.

### 📍 Real-Time Location Tracking
- Admins can view **live user routes** and **historical routes**.  
- Helps analyze **field visit coverage** and optimize travel routes.  
- Integrated with **Google Maps API** for accurate route visualization.

### 👨‍🌾 Farmer Management
- Maintain a complete **Farmer Database** with profile details.  
- Add, edit, or delete farmer records.  
- Store **sampling data, harvesting information, and visit history** for each farmer.

### 📋 Task Scheduling & Assignment
- Create, assign, and manage **daily or periodic tasks** for field agents.  
- Perfect for **sampling plans**, **harvesting schedules**, and **inspection visits**.  
- Real-time **task tracking** and completion updates for admins.

### 🧾 Attendance & Leave Management
- Employees can **apply for leave** directly through the app.  
- Admins can **approve/reject** requests instantly.  
- Attendance and location logs help maintain **accurate working hours**.

### ✅ To-Do & Daily Planner
- Field agents can create and manage their **own to-do lists**.  
- Add, edit, and delete personal tasks.  
- Track progress and improve **daily productivity**.

### 📊 Admin Dashboard & Reports
- Centralized dashboard to view:
  - Daily check-ins and check-outs  
  - Total active agents  
  - Tasks completed vs pending  
  - Distance covered and time spent in the field  
- Export reports for **payroll or performance analysis**.

### 🔔 Notifications & Alerts
- Instant push notifications for:
  - Task assignment and updates  
  - Check-in / checkout reminders  
  - Leave approvals  
  - Important announcements

### 🛰️ Offline Support *(Optional)*
- Record visits even in **low or no network** areas.  
- Data syncs automatically when connectivity is restored.

---

## 🧰 Tech Stack

| Layer | Technology |
|-------|-------------|
| **Frontend** | Flutter (Cross-platform mobile app) |
| **Backend** | Laravel / |
| **Maps & Tracking** | Google Maps API, Geolocator |
| **Notifications** | Firebase Cloud Messaging (FCM) |

---
