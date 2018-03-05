create database testdb;
grant all on testdb.* to 'testuser' identified by 'pass';
Create Table Users(
	first_name char(10), 
	last_name char(10), 
	username char(10), 
	postNo int, 
	upvotes int, 
	downvotes int, 
	last_access Date, 
	created_date Date, 
	bdate Date, 
	reputation int, 
	Primary Key (username)
);
Create Table Subjects(
	tagId char(10), 
	tagName char(100), 
	Primary Key (tagId)
);
Create Table Posts(
	postId char(20), 
	content text, 
	score int, 
	username char(10), 
	submitDate Date,
	lastEdited Date, 
	Primary Key (postId),
	Foreign Key (username) references Users (username)
);
Create Table Questions(
	questionId char(20), 
	postId char(20), 
	tagId char(10),
	Primary Key (postId, tagId), 
	Foreign Key (postId) references Posts (postId), 
	Foreign Key (tagId) references Subjects (tagId)
);
Create Table Answers(
	questionpostId char(20), 
	tagId char(10), 
	postId char(20), 
	Primary Key (postId, tagId), 
	Foreign Key (questionpostId, tagId) references Questions(postId, tagId) on delete cascade
);
Create Table Comments(
	commentId char(20), 
	username char(10), 
	postId char(20), 
	commentContent text,
	Primary Key (commentId). 
	Foreign Key (postId) references Posts (postId), 
	Foreign Key (username) references Users (username)
);
Create Table PostsHasComments(
	commentId char(20), 
	postId char(20), 
	Primary Key (postId, commentId), 
	Foreign Key (postId) references Posts(postId), 
	Foreign Key (commentId) references Comments(commentId)
);
Create Table UsersWroteComments(
	commentId char(20), 
	username char(10), 
	Primary Key (commentId, username), 
	Foreign Key (commentId) references Comments (commentId), 
	Foreign Key (username) references Users (username)
);
Create Table UsersWrotePosts(
	postId char(20), 
	username char(10), 
	Primary Key (postId, username), 
	Foreign Key (postId) references Posts(postId), 
	Foreign Key (username) references Users (username)
);