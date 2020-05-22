package by.bsuir.service;

import by.bsuir.entity.User;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);

    User findLoggedInUser();
}
