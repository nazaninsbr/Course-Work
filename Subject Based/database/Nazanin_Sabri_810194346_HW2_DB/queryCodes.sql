select * from Subjects; 
select * from Users;
select * from Posts; 
select * from Answers;
select content, username from Posts where username='ns';
select P.content , P.username from Questions Q, Posts P where Q.postId = P.postId; 