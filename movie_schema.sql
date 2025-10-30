CREATE DATABASE MovieRecommendationDB;
USE MovieRecommendationDB;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ReleaseYear YEAR,
    Language VARCHAR(50),
    Duration INT,
    AddedDate DATETIME DEFAULT NOW()
);

CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(50) UNIQUE
);

CREATE TABLE MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID) ON DELETE CASCADE
);

CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    RatingDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE
);

CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    ReviewText TEXT,
    ReviewDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE
);

CREATE TABLE WatchHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE
);

INSERT INTO Genres (GenreName) VALUES
('Action'), ('Comedy'), ('Drama'), ('Romance'), ('Sci-Fi'), ('Thriller'), ('Adventure'), ('Horror'), ('Animation'), ('Fantasy');

INSERT INTO Users (Name, Age, Email) VALUES
('User1', 21, 'user1@mail.com'),
('User2', 24, 'user2@mail.com'),
('User3', 27, 'user3@mail.com'),
('User4', 19, 'user4@mail.com'),
('User5', 29, 'user5@mail.com');

INSERT INTO Movies (Title, ReleaseYear, Language, Duration) VALUES
('Inception', 2010, 'English', 148),
('3 Idiots', 2009, 'Hindi', 170),
('Interstellar', 2014, 'English', 169),
('Zindagi Na Milegi Dobara', 2011, 'Hindi', 155),
('Avengers Endgame', 2019, 'English', 181),
('Jawan', 2023, 'Hindi', 169),
('Dangal', 2016, 'Hindi', 161),
('The Dark Knight', 2008, 'English', 152),
('PK', 2014, 'Hindi', 153),
('Kantara', 2022, 'Kannada', 150),
('RRR', 2022, 'Telugu', 182),
('Pushpa', 2021, 'Telugu', 179),
('Pathaan', 2023, 'Hindi', 146),
('Spider-Man: No Way Home', 2021, 'English', 148),
('Avatar: The Way of Water', 2022, 'English', 192),
('KGF Chapter 2', 2022, 'Kannada', 168),
('Bahubali 2', 2017, 'Telugu', 171),
('Drishyam 2', 2022, 'Hindi', 140),
('The Matrix', 1999, 'English', 136),
('Tenet', 2020, 'English', 150);
('The Laughing Ghost', 1988, 'English', 95),
('Quest for the Sun', 2024, 'English', 140),
('Love in Paris', 2005, 'English', 110),
('Digital Nightmare', 2040, 'English', 135),
('Brave Little Robot', 2018, 'English', 85),
('The Silent Witness', 2015, 'Hindi', 145),
('Iron Fist', 2017, 'Hindi', 160),
('Ancient Kingdoms', 2012, 'Telugu', 180),
('The Proposal', 2007, 'Telugu', 105),
('The Vanishing', 2021, 'Kannada', 130);

INSERT INTO MovieGenres (MovieID, GenreID) VALUES
(1,5),(1,1),
(2,2),(2,3),
(3,5),(3,3),
(4,2),(4,4),
(5,1),(5,7),
(6,1),(6,3),
(7,3),(7,7),
(8,1),(8,6),
(9,2),(9,3),
(10,3),(10,7),
(11,1),(11,7),
(12,1),(12,3),
(13,1),(13,3),
(14,1),(14,5),
(15,5),(15,7),
(16,1),(16,6),
(17,1),(17,7),
(18,6),(18,3),
(19,5),(19,6),
(20,5),(20,1),
(21, 2), (21, 8),
(22, 7), (22, 10),
(23, 4), (23, 3),
(24, 5), (24, 6),
(25, 9),
(26, 6), (26, 3),
(27, 1), (27, 7),
(28, 7), (28, 10),
(29, 4), (29, 2),
(30, 8), (30, 6);

INSERT INTO Ratings (UserID, MovieID, Rating) VALUES
(1,1,4.5),(1,2,4.8),(1,5,5.0),(1,8,4.9),(1,9,4.2),
(2,3,4.7),(2,4,4.6),(2,5,4.9),(2,10,4.5),(2,11,4.8),
(3,6,4.9),(3,7,4.5),(3,8,5.0),(3,12,4.4),(3,13,4.8),
(4,14,4.9),(4,15,4.6),(4,16,4.8),(4,17,4.7),(4,18,4.5),
(5,19,4.7),(5,20,4.5),(5,1,4.6),(5,5,5.0),(5,7,4.9),
(1, 21, 3.0), (2, 21, 2.0), (3, 21, 2.5),
(4, 22, 4.0), (5, 22, 4.2), (1, 22, 4.1),
(2, 23, 3.8), (3, 23, 3.2), (4, 23, 3.5),
(1, 24, 1.5), (5, 24, 2.1), (2, 24, 1.8),
(3, 25, 4.5), (4, 25, 4.7), (5, 25, 4.6),
(1, 26, 3.5), (2, 26, 3.0), (5, 26, 2.8),
(3, 27, 2.5), (4, 27, 3.0), (1, 27, 3.2),
(2, 28, 4.9), (3, 28, 4.8), (5, 28, 5.0),
(1, 29, 2.0), (4, 29, 2.5), (5, 29, 2.1),
(2, 30, 4.4), (3, 30, 4.6), (4, 30, 4.5);

INSERT INTO WatchHistory (UserID, MovieID) VALUES
(1,1),(1,2),(1,5),(1,8),(1,9),
(2,3),(2,4),(2,5),(2,10),(2,11),
(3,6),(3,7),(3,8),(3,12),(3,13),
(4,14),(4,15),(4,16),(4,17),(4,18),
(5,19),(5,20),(5,1),(5,5),(5,7),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(1, 26), (2, 27), (3, 28), (4, 29), (5, 30),
(1, 23), (2, 26);

CREATE VIEW TopRatedMovies AS
SELECT M.Title, ROUND(AVG(R.Rating),2) AS AvgRating
FROM Movies M JOIN Ratings R ON M.MovieID = R.MovieID
GROUP BY M.MovieID ORDER BY AvgRating DESC;

CREATE VIEW PopularGenres AS
SELECT G.GenreName, COUNT(W.MovieID) AS WatchCount
FROM WatchHistory W
JOIN MovieGenres MG ON W.MovieID = MG.MovieID
JOIN Genres G ON MG.GenreID = G.GenreID
GROUP BY G.GenreID ORDER BY WatchCount DESC;

DELIMITER //
CREATE TRIGGER NotifyNewMovie
AFTER INSERT ON Movies
FOR EACH ROW
BEGIN
    INSERT INTO Reviews (UserID, MovieID, ReviewText)
    VALUES (1, NEW.MovieID, CONCAT('New movie "', NEW.Title, '" added.'));
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetRecommendations(IN inputUser INT)
BEGIN
    SELECT DISTINCT M.Title, G.GenreName, ROUND(AVG(R.Rating),1) AS AvgRating
    FROM Movies M
    JOIN MovieGenres MG ON M.MovieID = MG.MovieID
    JOIN Genres G ON MG.GenreID = G.GenreID
    JOIN Ratings R ON M.MovieID = R.MovieID
    WHERE G.GenreName IN (
        SELECT G2.GenreName
        FROM WatchHistory W2
        JOIN MovieGenres MG2 ON W2.MovieID = MG2.MovieID
        JOIN Genres G2 ON MG2.GenreID = G2.GenreID
        WHERE W2.UserID = inputUser
    )
    GROUP BY M.MovieID
    ORDER BY AvgRating DESC
    LIMIT 5;
END;
//
DELIMITER ;

SELECT * FROM TopRatedMovies;
SELECT * FROM PopularGenres;
CALL GetRecommendations(1);
