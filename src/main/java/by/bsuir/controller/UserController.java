package by.bsuir.controller;

import by.bsuir.entity.User;
import by.bsuir.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    //TODO исправить какие страницы будут возвращаться в случае успеха или ошибки
    @RequestMapping(value = "/book/{id}/{status}", method = RequestMethod.GET)
    public ModelAndView bookFlat(@PathVariable Long id, @PathVariable String status) {
        ModelAndView modelAndView = new ModelAndView();
        if (userService.bookFlat(id, status)) {
            modelAndView.addObject("success", "You send a request for reservation.");
            modelAndView.setViewName("index");
        } else {
            modelAndView.addObject("error", "Unfortunately, there was an error." +
                    "Please try again later.");
            modelAndView.setViewName("flats");
        }
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getUsers() {
        List<User> users = userService.getUsers();
        return new ModelAndView("users", "users", users);
    }
    @RequestMapping(value="/{id}", method = RequestMethod.GET)
    public ModelAndView getUser(@PathVariable Long id) {
        User user = userService.getUser(id);
        System.out.println(user.toString());
        return new ModelAndView("user", "user", user);
    }
}
