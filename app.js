// ============================================
// Connectify - Social Media Platform
// CodeAlpha Full Stack Internship — Task 2
// Backend: Express.js + MySQL
// ============================================

const express  = require('express');
const session  = require('express-session');
const cors     = require('cors');
const path     = require('path');

const authRoutes    = require('./routes/auth');
const postRoutes    = require('./routes/posts');
const userRoutes    = require('./routes/users');
const commentRoutes = require('./routes/comments');

const app  = express();
const PORT = 4000;

// ── Middleware ──────────────────────────────
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
    secret: 'connectify_secret_2026',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 24 * 60 * 60 * 1000 } // 1 day
}));

// ── API Routes ──────────────────────────────
app.use('/api/auth',     authRoutes);
app.use('/api/posts',    postRoutes);
app.use('/api/users',    userRoutes);
app.use('/api/comments', commentRoutes);

// ── HTML Pages ──────────────────────────────
app.get('/',         (req, res) => res.sendFile(path.join(__dirname, 'views', 'login.html')));
app.get('/login',    (req, res) => res.sendFile(path.join(__dirname, 'views', 'login.html')));
app.get('/register', (req, res) => res.sendFile(path.join(__dirname, 'views', 'register.html')));
app.get('/feed',     (req, res) => res.sendFile(path.join(__dirname, 'views', 'feed.html')));
app.get('/profile',  (req, res) => res.sendFile(path.join(__dirname, 'views', 'profile.html')));
app.get('/explore',  (req, res) => res.sendFile(path.join(__dirname, 'views', 'explore.html')));

// ── Start Server ─────────────────────────────
app.listen(PORT, () => {
    console.log(`✅ Connectify server is running: http://localhost:${PORT}`);
});
