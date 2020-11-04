-- 1
SELECT u.id, u.first_name, u.last_name FROM users u LEFT JOIN user_contacts ON users.id=user_contacts.user_id
WHERE user_contacts.id IS NULL GROUP BY u.id, u.first_name, u.last_name;;

-- 2
SELECT u.id, u.first_name, u.last_name FROM users u INNER JOIN user_contacts uc ON u.id = uc.user_id GROUP BY u.id, u.first_name, u.last_name;


-- 3
SELECT u.id, u.first_name, u.last_name FROM users u INNER JOIN user_contacts uc ON u.id = uc.user_id GROUP BY u.id, u.first_name, u.last_name HAVING count(u.id) > 3;

-- 4
-- менее производительный вариант, чем с with, но больше уверености в работоспособности
SELECT u.id, u.first_name, u.last_name FROM users u INNER JOIN user_contacts uc ON u.id = uc.user_id
GROUP BY u.id, u.first_name, u.last_name
HAVING count(u.id) > 3
AND(
    select count(c.user_id) = 0 from user_contacts c  where c.user_id = u.id and c.type = 'email');