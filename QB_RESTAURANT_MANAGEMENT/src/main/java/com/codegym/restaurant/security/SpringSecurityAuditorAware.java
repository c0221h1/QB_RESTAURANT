<<<<<<< HEAD
package com.codegym.restaurant.security;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class SpringSecurityAuditorAware implements AuditorAware<Long> {

    @Override
    public Optional<Long> getCurrentAuditor() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }
        if (authentication.getPrincipal() == "anonymousUser") {
            return Optional.of(0L);
        }
        return Optional.of(((UserPrincipal) authentication.getPrincipal()).getUserId());
    }

}
=======
package com.codegym.restaurant.security;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class SpringSecurityAuditorAware implements AuditorAware<Long> {

    @Override
    public Optional<Long> getCurrentAuditor() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }
        if (authentication.getPrincipal() == "anonymousUser") {
            return Optional.of(0L);
        }
        return Optional.of(((UserPrincipal) authentication.getPrincipal()).getUserId());
    }

}
>>>>>>> 8c604e44383d00fbd0295616e57c35a2091ab4aa
