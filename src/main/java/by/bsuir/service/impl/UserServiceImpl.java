package by.bsuir.service.impl;

import by.bsuir.entity.Authority;
import by.bsuir.entity.Flat;
import by.bsuir.entity.User;
import by.bsuir.repository.AuthorityRepository;
import by.bsuir.repository.FlatRepository;
import by.bsuir.repository.UserRepository;
import by.bsuir.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private FlatRepository flatRepository;

    @Override
    public boolean saveUser(User user) {
        User user1 = userRepository.findByUsername(user.getUsername());
        if (null != user1) {return false;}
        Authority authority = authorityRepository.getOne(2L);
        Set<Authority> authorities = new HashSet<>();
        authorities.add(authority);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true);
        user.setAuthorities(authorities);
        Set<User> users = new HashSet<>();
        users.add(user);
        authority.setUsers(users);
        userRepository.save(user);
        return true;
    }

    @Override
    public void updateUser(User newUser) {
        User oldUser = userRepository.getOne(newUser.getId());
        oldUser.setUsername(newUser.getUsername());
        oldUser.setPassword(newUser.getPassword());
        oldUser.setEnabled(newUser.getEnabled());
    }

    @Override
    public void deleteUser(Long id) {
        userRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public User getUser(Long id) {
        User user = userRepository.findOne(id);
        //user.setFlats(user.getFlats());
        return user;
    }

    @Override
    public boolean changeEnable(Long id, boolean flag) {
        userRepository.changeEnable(id, flag);
        User user = userRepository.findOne(id);
        return flag != user.getEnabled();
    }

    @Override
    public boolean bookFlat(Long idFlat, String status) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByUsername(username);
        flatRepository.bookFlat(idFlat, user.getId(), status);
        Flat flat = flatRepository.findById(idFlat);
        return  (!"free".equals(flat.getFlatStatus().getType()));
    }

    @Transactional(readOnly = true)
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
