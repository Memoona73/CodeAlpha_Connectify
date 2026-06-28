-- ============================================
-- Connectify Social Media — Database
-- Import this file in phpMyAdmin
-- ============================================

CREATE DATABASE IF NOT EXISTS connectify_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE connectify_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(255) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    bio        TEXT,
    avatar     VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE IF NOT EXISTS posts (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    content    TEXT NOT NULL,
    image      VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Likes table
CREATE TABLE IF NOT EXISTS likes (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    UNIQUE KEY unique_like (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Comments table
CREATE TABLE IF NOT EXISTS comments (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    post_id    INT NOT NULL,
    user_id    INT NOT NULL,
    content    TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Follows table
CREATE TABLE IF NOT EXISTS follows (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    follower_id  INT NOT NULL,
    following_id INT NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_follow (follower_id, following_id),
    FOREIGN KEY (follower_id)  REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Demo Users (password: password123)
INSERT INTO users (username, full_name, email, password, bio) VALUES
('ayesha_k',  'Ayesha Khan',   'ayesha@demo.com',  '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Jewelry lover 💎 | Lahore'),
('sara_m',    'Sara Malik',    'sara@demo.com',    '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Fashion & lifestyle blogger ✨'),
('ahmed_r',   'Ahmed Raza',    'ahmed@demo.com',   '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Software Engineer 💻 | Islamabad');

-- Demo Posts
INSERT INTO posts (user_id, content) VALUES
(1, 'Just got the most stunning diamond ring from LuxeAura! 💍✨ Absolutely in love with the craftsmanship!'),
(2, 'Morning coffee and good vibes only ☕🌸 What are you all up to today?'),
(3, 'Just deployed my first Express.js project! Full stack development is so exciting 🚀💻'),
(1, 'Blessed to have such an amazing collection of jewelry. Every piece tells a story 💎'),
(2, 'Weekend vibes! Exploring the city and loving every moment 🌆✨');

-- Demo Likes
INSERT INTO likes (post_id, user_id) VALUES (1,2),(1,3),(2,1),(2,3),(3,1),(3,2),(4,2),(5,1),(5,3);

-- Demo Comments
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'Oh wow that looks absolutely stunning! 😍'),
(1, 3, 'LuxeAura never disappoints! Great choice 💯'),
(2, 1, 'Same here! Enjoying my morning too ☕'),
(3, 1, 'Congratulations! Full stack is the future 🔥'),
(3, 2, 'Awesome work Ahmed! Keep it up 👏');

-- Demo Follows
INSERT INTO follows (follower_id, following_id) VALUES (1,2),(1,3),(2,1),(3,1),(3,2);
