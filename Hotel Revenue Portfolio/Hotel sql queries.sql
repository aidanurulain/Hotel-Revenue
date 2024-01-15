-- combine table 
CREATE VIEW hotelunion AS 
(SELECT * FROM year2018
UNION 
SELECT * FROM year2019
UNION 
SELECT * FROM year2020);

SELECT *
FROM hotelunion;

SELECT *
FROM market_segment;

SELECT *
FROM meal_cost;




-- to see if revenue increase by year

SELECT arrival_date_year,required_car_parking_spaces,hotel,ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),2) AS revenue
FROM hotelunion
GROUP BY arrival_date_year,required_car_parking_spaces,hotel;

-- to join view with all table

SELECT * 
FROM hotelunion H
LEFT JOIN market_segment M ON H.market_segment = M.market_segment
LEFT JOIN meal_cost C ON H.meal = C.meal;




