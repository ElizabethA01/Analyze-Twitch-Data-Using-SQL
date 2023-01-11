-- Select the first 20 rows from each of the two tables
SELECT *
FROM stream
LIMIT 20;

SELECT * 
FROM chat
LIMIT 20;

-- What are the unique games in the stream table?
SELECT DISTINCT game
FROM stream;

-- What are the unique channels in the stream table?
SELECT DISTINCT channel
FROM stream;

-- What are the most popular games in the stream table?
SELECT game, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

-- CONCLUSION -> The most popular game is League of Legends (LoL)

-- Where are these LoL stream viewers located?

SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- CONCLUSION -> The top three countries to stream the game LoL are US, DE and CA in chronological order. However, US has a significant number of LoL viewers.

-- Create a list of players and their number of streamers.
SELECT player, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- CONCLUSION -> The games are streamed the highest on their sites

-- Create a new column named genre for each of the games.

-- Group the games into their genres: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.

SELECT game, 
  CASE
    WHEN game = 'League of Legends' THEN 'MOBA'
    WHEN game = 'Dota 2' THEN 'MOBA'
    WHEN game = 'Heroes of the Storm' THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
    WHEN game = 'DayZ' THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
    ELSE 'Other'
  END AS 'Genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

-- CONCLUSION -> The MOBA is the most popular genre of games on Twitch

-- How does view count change in the course of a day (in hours)?

SELECT strftime('%H', time), COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1
ORDER BY 1 ASC;

-- CONCLUSION -> Results show that in the US, the time where the view count is highest is between 19:00 - 22:00. 

-- Joining the two tables stream and chat
SELECT * 
FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;

