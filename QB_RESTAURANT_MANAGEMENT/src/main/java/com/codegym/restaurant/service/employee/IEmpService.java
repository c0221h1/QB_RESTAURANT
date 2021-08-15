<<<<<<< HEAD
package com.codegym.restaurant.service.employee;

import com.codegym.restaurant.model.Employee;
import com.codegym.restaurant.service.IGeneralService;
import org.springframework.data.repository.query.Param;


public interface IEmpService extends IGeneralService<Employee> {
	
	int countEmployee();
	
	int countByStatusFalse();
}
=======
package com.codegym.restaurant.service.employee;

import com.codegym.restaurant.model.Employee;
import com.codegym.restaurant.service.IGeneralService;
import org.springframework.data.repository.query.Param;


public interface IEmpService extends IGeneralService<Employee> {
	
	int countEmployee();
	
	int countByStatusFalse();
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
