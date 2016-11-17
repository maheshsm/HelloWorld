var module = angular.module('app', []);



module.factory('UserService',function(){
   var uid = 1;
    
 
   var Students = [{
        id: 0,
        'firstname': 'Sachin',
		'lastname': 'Patil',
            'email': 'sachu@gmail.com',
            'ext': '9528635478',
			'doj':'12-05-2016',
			'bench':'Y'
    }];
    
 
    var factory = {
       fetchAllUsers: fetchAllUsers,
       list:list,
	   save:save,
	   get:get,
	   delete1:delete1
	   
    };
 
    return factory;
 
    function fetchAllUsers() {
     
        return "hello";
    }
	
   function list() {
        return Students;
    }
    //save method create a new Student if not already exists
    function save(Student) {
        if (Student.id == null) {
            //if this is new Student, add it in Students array
            Student.id = uid++;
            Students.push(Student);
        } else {
            //for existing Student, find this Student using id
            //and update it.
            for (i in Students) {
                if (Students[i].id == Student.id) {
                    Students[i] = Student;
                }
            }
        }

    }

    function get(id) {
        for (i in Students) {
            if (Students[i].id == id) {
                return Students[i];
            }
        }

    }
    
    function delete1(id) {
        for (i in Students) {
            if (Students[i].id == id) {
                Students.splice(i, 1);
            }
        }
    }

 
});

