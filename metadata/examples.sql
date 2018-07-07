SELECT * FROM users
SELECT u_id,u_name FROM users
SELECT count(u_id) FROM users
SELECT * FROM users WHERE u_login = 'o.rodiuk@gmail.com'
SELECT * FROM users WHERE UPPER(u_login) = UPPER('o.rodiuk@gmail.com')
SELECT * FROM users WHERE LOWER(u_login) = 'o.rodiuk@gmail.com'
SELECT * FROM users WHERE LOWER(u_login) LIKE 'v%'
SELECT * FROM users WHERE LOWER(u_login) LIKE 'd%m%'
SELECT * FROM users WHERE LOWER(u_login) LIKE '%d%m%'
SELECT * FROM users WHERE LOWER(u_login) LIKE '%d%m%' AND u_name LIKE 'D%'
SELECT * FROM users WHERE LOWER(u_login) LIKE '%d%m%' AND u_id<20
SELECT u_group, count(u_group) FROM users GROUP BY u_group
SELECT u_group FROM users GROUP BY u_group
SELECT DISTINCT u_group FROM users
SELECT DISTINCT u_group FROM users ORDER BY u_group DESC
SELECT DISTINCT u_group FROM users ORDER BY u_group ASC
SELECT * FROM users ORDER BY u_group ASC, u_name DESC
SELECT u_group g, count(u_group) f FROM users GROUP BY u_group
SELECT u_group g, g_name, count(u_group) f FROM users JOIN "group" ON g_id=u_group GROUP BY u_group, g_name
SELECT * FROM users JOIN "group" ON g_id=u_group
SELECT * FROM users JOIN "group" ON g_id=u_group
SELECT u_id, u_name, g_name FROM users JOIN "group" ON g_id=u_group
SELECT g_name, count(u_id) FROM users JOIN "group" ON g_id=u_group GROUP BY g_name
SELECT g_name, count(u_id) FROM users RIGHT OUTER JOIN "group" ON g_id=u_group GROUP BY g_name
SELECT g_name, count(u_id) FROM users RIGHT OUTER JOIN "group" ON g_id=u_group GROUP BY g_name HAVING count(u_id)=0
SELECT g_name, count(u_id) FROM users RIGHT OUTER JOIN "group" ON g_id=u_group GROUP BY g_name HAVING count(u_id)>0
SELECT p_user, count(p_question) FROM process GROUP BY p_user
SELECT u_name, count(p_question) FROM process JOIN users on users.u_id=process.p_user GROUP BY u_name
SELECT u_name, count(p_question) FROM process JOIN users on users.u_id=process.p_user GROUP BY u_name ORDER BY count(p_question) DESC
SELECT u_name, g_name, count(p_question) FROM process JOIN users on users.u_id=process.p_user JOIN "group" on "group".g_id=users.u_group GROUP BY u_name, g_name ORDER BY count(p_question) DESC
SELECT u_id, u_name from (SELECT * from users) u
SELECT u_id, u_name, g_name from (SELECT * from users) u, (SELECT * from "group") g WHERE u.u_group=g.g_id
SELECT u_id, u_name, g_name from (SELECT * from users) u, (SELECT * from "group") g WHERE u.u_group=g.g_id
SELECT u_id, u_name
FROM users WHERE u_id IN (SELECT DISTINCT p_user FROM process)
SELECT u_id, u_name FROM users WHERE u_id NOT IN (SELECT DISTINCT p_user FROM process)
WITH u AS (SELECT * from users), g AS (SELECT * from "group") SELECT * FROM u

WITH
    stat_skipped AS (SELECT p_user, count(*) cnt_skipped from process WHERE p_answer=0 group by p_user),
    stat_answered AS (SELECT p_user, count(*) cnt_answered from process WHERE p_answer>0 group by p_user)
SELECT
  g_name, u_id, u_name, cnt_answered, cnt_skipped
FROM users
  JOIN stat_answered on stat_answered.p_user=u_id
  JOIN stat_skipped on stat_skipped.p_user=u_id
  RIGHT OUTER JOIN "group" on g_id=u_group

