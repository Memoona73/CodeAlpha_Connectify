# Connectify - Social Media Platform
**CodeAlpha Full Stack Development Internship — Task 2**

## Tech Stack
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Node.js + Express.js
- **Database:** MySQL (via mysql2)

## Features
- ✅ User Registration & Login (with bcrypt password hashing)
- ✅ Create & Delete Posts
- ✅ Like / Unlike Posts
- ✅ Comments on Posts
- ✅ Follow / Unfollow Users
- ✅ User Profiles
- ✅ Explore People page
- ✅ Live Feed

## Project Structure
```
connectify-social/
├── app.js              ← Main Express server (Port 4000)
├── config/db.js        ← MySQL connection
├── routes/
│   ├── auth.js         ← Register, Login, Logout
│   ├── posts.js        ← Create, Like, Delete posts
│   ├── comments.js     ← Add, View comments
│   └── users.js        ← Profile, Follow, Explore
├── views/              ← HTML pages
│   ├── login.html
│   ├── register.html
│   ├── feed.html
│   ├── profile.html
│   └── explore.html
├── public/css/style.css
└── connectify_database.sql
```

## How to Run

### Step 1 — Database Setup
1. XAMPP → Start MySQL only (Apache not needed)
2. phpMyAdmin → New → `connectify_db` → Create
3. Import `connectify_database.sql`

### Step 2 — Install & Run
```bash
cd connectify-social
npm install
node app.js
```

### Step 3 — Open
```
http://localhost:4000
```

## Demo Login
- Email: `ayesha@demo.com` / Password: `password`
- Email: `sara@demo.com` / Password: `password`

## Pages
| URL | Page |
|-----|------|
| http://localhost:4000 | Login |
| http://localhost:4000/register | Register |
| http://localhost:4000/feed | Home Feed |
| http://localhost:4000/explore | Explore People |
| http://localhost:4000/profile | My Profile |
