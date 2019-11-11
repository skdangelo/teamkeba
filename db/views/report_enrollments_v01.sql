select users.email, users.firstname, users.lastname, users.cell, users.parent1, users.parent2,
enrollments.Program_id, programs.Title, programs.cost
from users
inner join enrollments 
on users.id = enrollments.User_id 
inner join programs
on enrollments.Program_id = programs.id
order by users.Lastname, users.Firstname;