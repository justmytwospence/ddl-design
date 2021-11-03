SELECT
    team_id,
    COUNT(CASE outcome WHEN 'loss' THEN 1 END) AS losses,
    COUNT(CASE outcome WHEN 'win' THEN 1 END) AS wins,
    COUNT(CASE outcome WHEN 'tie' THEN 1 END) AS ties
FROM soccer."Outcome" o
LEFT JOIN soccer."Match" m ON o.match_id = m.id
WHERE season_id = 1
GROUP BY 1