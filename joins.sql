SELECT *
FROM users;

SELECT *
FROM posts
WHERE posts.users = 100;

SELECT posts.*, first_name, last_name
FROM posts
INNER JOIN users ON posts.users = users.id
WHERE posts.users = 200;

SELECT posts.*, username
FROM posts
INNER JOIN users ON users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username
FROM users
INNER JOIN posts ON posts.users = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

SELECT title, content, users.username
FROM posts
INNER JOIN users ON posts.users = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

SELECT "Post Title", comments.*
FROM posts p (id, "Post Title")
INNER JOIN comments ON p.id = comments.posts

SELECT post_title, post_url, comment_body
FROM posts p (id, post_title, post_url)
INNER JOIN comments c (id, comment_body) ON p.id = c.posts
WHERE p.created_at < '2015-01-01 00:00:00-10';

SELECT post_title, post_url, comment_body
FROM posts p (id, post_title, post_url)
INNER JOIN comments c (id, comment_body) ON p.id = c.posts
WHERE p.created_at > '2015-01-01 00:00:00-10';

SELECT post_title, post_url, comment_body
FROM posts p (id, post_title, post_url)
INNER JOIN comments c (id, comment_body) ON p.id = c.posts
WHERE comment_body LIKE '%USB%';

SELECT post_title, first_name, last_name, comment_body
FROM posts p (id, post_title)
INNER JOIN users u (id, username, first_name, last_name) ON u.id = p.users
INNER JOIN comments c (id, comment_body) ON c.posts = p.id
WHERE c.comment_body LIKE '%matrix%';

SELECT first_name, last_name, comment_body
FROM comments c (id, comment_body)
INNER JOIN users ON users.id = c.users
INNER JOIN posts ON posts.id = c.users
WHERE c.comment_body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT post_author_first_name, post_author_last_name, post_title, comment_author_username, comment_body
from users u (id, comment_author_username, post_author_first_name, post_author_last_name)
INNER JOIN posts p (id, post_title) ON p.users = u.id
INNER JOIN comments c (id, comment_body) ON c.posts = p.id
WHERE (c.comment_body LIKE '%SSL%'
  OR  c.comment_body LIKE '%firewall%')
  AND p.content LIKE '%nemo%';

