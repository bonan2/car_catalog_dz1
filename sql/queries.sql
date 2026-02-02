--   Запрос 1: Автомобили по цене выше средней, с сортировкой от новых к старым
SELECT 
    brand, 
    model, 
    year, 
    price,
    (SELECT AVG(price) FROM cars) AS "Средняя_цена_по_каталогу"
FROM cars
WHERE price > (SELECT AVG(price) FROM cars)
ORDER BY year DESC;

-- Запрос 2: Статистика по годам выпуска (количество, мин/макс цена)
SELECT 
    year,
    COUNT(*) AS "Количество_машин",
    MIN(price) AS "Минимальная_цена",
    MAX(price) AS "Максимальная_цена",
    ROUND(AVG(price), 2) AS "Средняя_цена_в_году"
FROM cars
GROUP BY year
ORDER BY year DESC;

-- Запрос 3: Топ-5 самых популярных комбинаций бренд-цвет
SELECT 
    brand,
    color,
    COUNT(*) AS "Количество"
FROM cars
GROUP BY brand, color
ORDER BY "Количество" DESC
LIMIT 5;

-- Запрос 4: Категоризация по ценовому сегменту
SELECT 
    brand,
    model,
    price,
    CASE 
        WHEN price < 1000000 THEN 'бюджетный'
        WHEN price BETWEEN 1000000 AND 3000000 THEN 'средний'
        ELSE 'премиум'
    END AS "Ценовой_сегмент"
FROM cars
ORDER BY price DESC;

-- Запрос 5: Самые новые автомобили каждой марки
SELECT 
    brand,
    model,
    year,
    color,
    price
FROM cars c1
WHERE year = (
    SELECT MAX(year)
    FROM cars c2
    WHERE c2.brand = c1.brand
)
ORDER BY brand, year DESC;