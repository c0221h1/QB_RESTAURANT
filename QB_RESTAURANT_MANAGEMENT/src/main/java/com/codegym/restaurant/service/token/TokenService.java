<<<<<<< HEAD
package com.codegym.restaurant.service.token;

import com.codegym.restaurant.model.Token;
import com.codegym.restaurant.repository.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TokenService implements ITokenService {

    @Autowired
    private TokenRepository tokenRepository;

    public Token createToken(Token token) {
        return tokenRepository.saveAndFlush(token);
    }

    @Override
    public Token findByToken(String token) {
        return tokenRepository.findByToken(token);
    }
}
=======
package com.codegym.restaurant.service.token;

import com.codegym.restaurant.model.Token;
import com.codegym.restaurant.repository.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TokenService implements ITokenService {

    @Autowired
    private TokenRepository tokenRepository;

    public Token createToken(Token token) {
        return tokenRepository.saveAndFlush(token);
    }

    @Override
    public Token findByToken(String token) {
        return tokenRepository.findByToken(token);
    }
}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
