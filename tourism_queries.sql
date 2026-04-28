
-- Q1: Total revenue by hotel city
SELECT hotel_city,
       ROUND(SUM(total_cost),2) AS revenue
FROM SL_tourism_bookings
GROUP BY hotel_city;

-- Q2: Total bookings by country
SELECT tourist_country,
       COUNT(*) AS total_bookings
FROM SL_tourism_bookings
GROUP BY tourist_country;

-- Q3: Average spend by room type
SELECT room_type,
       ROUND(AVG(total_cost),2) AS avg_spend
FROM SL_tourism_bookings
GROUP BY room_type;

-- Q4: Revenue by hotel stars
SELECT hotel_stars,
       ROUND(SUM(total_cost),2) AS revenue
FROM SL_tourism_bookings
GROUP BY hotel_stars
ORDER BY revenue DESC;

-- Q5: Booking channel performance
SELECT booking_channel,
       COUNT(*) AS total_bookings
FROM SL_tourism_bookings
GROUP BY booking_channel
ORDER BY total_bookings DESC;

-- Q6: Monthly revenue trend
SELECT month,
       ROUND(SUM(total_cost),2) AS revenue
FROM SL_tourism_bookings
GROUP BY month
ORDER BY month;

-- Q7: Stay type analysis
SELECT 
    CASE 
        WHEN nights <= 3 THEN 'Short Stay'
        WHEN nights BETWEEN 4 AND 7 THEN 'Medium Stay'
        ELSE 'Long Stay'
    END AS stay_type,
    COUNT(*) AS bookings,
    ROUND(AVG(total_cost),2) AS avg_spend
FROM SL_tourism_bookings
GROUP BY stay_type;

-- Q8: Top 5 cities by average spend
SELECT hotel_city,
       ROUND(AVG(total_cost),2) AS avg_revenue
FROM SL_tourism_bookings
GROUP BY hotel_city
ORDER BY avg_revenue DESC
LIMIT 5;

-- Q9: Transport type usage
SELECT transport_type,
       COUNT(*) AS total_bookings
FROM SL_tourism_bookings
GROUP BY transport_type
ORDER BY total_bookings DESC;

-- Q10: Spend category distribution
SELECT spend_category,
       COUNT(*) AS customers,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM SL_tourism_bookings),2) AS percentage
FROM SL_tourism_bookings
GROUP BY spend_category;
