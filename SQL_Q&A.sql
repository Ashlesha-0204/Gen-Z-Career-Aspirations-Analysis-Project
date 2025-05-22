use gen_z_clean_ds;

-- Q1. What industries are Gen-Z most interested in pursuing careers in?
SELECT 
	Aspirational_Career_Choice AS 'Most Preferred Industries', 
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM genz_info WHERE Country = 'India')), 2) AS DISTRIBUTION
FROM genz_info
WHERE Country = 'India'
GROUP BY Aspirational_Career_Choice
ORDER BY DISTRIBUTION DESC;



-- Q2. What are the top factors influencing Gen-Z’s career choices?

SELECT 
	Influencing_factors, 
	ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM genz_info WHERE Country = 'India')), 2) AS DISTRIBUTION
FROM genz_info
WHERE Country = 'India'
GROUP BY Influencing_factors
ORDER BY DISTRIBUTION DESC;

-- Q3. What is the desired work environment for Gen-Z? (e.g., remote, hybrid, in-office)

SELECT 
	Preferred_Working_Environment AS 'Desired Work Environment', 
	ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM genz_info WHERE Country = 'India')), 2) AS DISTRIBUTION
FROM genz_info
WHERE Country = 'India'
GROUP BY Preferred_Working_Environment
ORDER BY DISTRIBUTION DESC;

-- Q4. How do financial goals, such as salary and benefits, impact career aspirations among Gen-Z?

SELECT Aspirational_Career_Choice, 
	Starting_Salary_Expectation, 
	`5-Year_Salary_Expectation`, 
    COUNT(*) AS Responses_Count
FROM genz_info
WHERE Country = 'India'
GROUP BY Aspirational_Career_Choice, Starting_Salary_Expectation, `5-Year_Salary_Expectation`
ORDER BY Responses_Count DESC;

-- Q5. What role do personal values and social impact play in career choices for Gen-Z?

SELECT 
    CASE 
        WHEN Mission_Lacking_Social_Impact BETWEEN 1 AND 4 THEN 'Strong Preference for Social Impact'
        WHEN Mission_Lacking_Social_Impact BETWEEN 5 AND 7 THEN 'Neutral About Social Impact'
        ELSE 'Willing to Work for Non-Social Impact Companies'
    END AS Social_Impact_Preference_Category,
    `Work_with_Mission-Action_Misalignment` AS 'Willing To Work with Companies with Misalignment Mission',
    COUNT(*) AS Individuals_Count
FROM genz_info
WHERE Country = 'India'
GROUP BY 
    Social_Impact_Preference_Category, 
    `Work_with_Mission-Action_Misalignment`
ORDER BY 
    Individuals_Count DESC;
