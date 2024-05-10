//package com.blog.app.Utility;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                .antMatchers("/register", "/login").permitAll() // Allow access to /register and /login without authentication
//                .anyRequest().authenticated() // Require authentication for all other requests
//                .and()
//                .formLogin()
//                .loginPage("/login") // Customize login page URL
//                .permitAll() // Allow access to the login page
//                .and()
//                .logout()
//                .permitAll();
//    }
//}

