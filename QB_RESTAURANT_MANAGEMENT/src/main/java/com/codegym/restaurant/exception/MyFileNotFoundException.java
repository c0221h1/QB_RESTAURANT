<<<<<<< HEAD
package com.codegym.restaurant.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class MyFileNotFoundException extends RuntimeException {
    public MyFileNotFoundException (String message) {
        super(message);
    }
    public MyFileNotFoundException (String message, Throwable cause) {
        super(message, cause);
    }
}
=======
package com.codegym.restaurant.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class MyFileNotFoundException extends RuntimeException {
    public MyFileNotFoundException (String message) {
        super(message);
    }
    public MyFileNotFoundException (String message, Throwable cause) {
        super(message, cause);
    }
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
