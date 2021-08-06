# Online-registration

<p align="justify">A dynamic web project I created on Eclipse where users can register, log in and search for other registered users. I used JSPs and Servlets for the back-end 
and MySQL for the database. The front end was developed using Bootstrap 5.</p>

## Notes

<p align="justify">When developing this project, I tried to stick to the MVC architecture and DAO design patterns as strictly as possible. Though I followed these design patterns 
mostly for experience, MVC is not necessary or even advisable for smaller scale projects due to the increased complexity that arises when implementing it. Even so, the modularity
of the code can improve reusability and make maintenance easier. The next step in this project would be to implement the DAO class using the Hibernate framework rather than SQL, 
which I plan to do later 
on.</p>

<p align="justify">I didn't have much time to devlop a responsive front end by myself, so I used Bootstrap 5 which helped complete the design of the views in a much shorter time. 
Even so, there are some pages which still need a little work in terms of responsiveness, particularly the Search Users page which has a table in it.</p>

<p align="justify">I'm trying to start using Maven so that projects like these which I upload on Github won't need to have their dependencies downloaded seperately. However, 
there seems to be a little issue on my IDE when using Maven which I'm trying to figure out at the moment. Until then, I'd advise anyone trying to run this project to add the JDBC 
driver for MySQL (ideally version 8.0.25) to the project's library.</p>

<p align="justify">I added a Search users functionality where a user can search for other users by User name or Field of interest as well. There seems to be an issue with the gitignore file in Eclipse so I had to manually delete some files and directories which were unnecessary to the repo.</p>
