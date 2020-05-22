package by.bsuir.service;


import by.bsuir.entity.User;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    boolean saveUser(User user);

    void updateUser(User user);

    void deleteUser(Long id);

    List<User> getUsers();

    User getUser(Long id);

    boolean changeEnable(Long id, boolean flag);

    boolean bookFlat(Long id, String status);

}
