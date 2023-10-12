use homeworkthree;
select pid, name, description
from products
where pid not in(select pid from sell)



	

    


