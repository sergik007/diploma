package by.bsuir.controller;

import by.bsuir.entity.User;
import by.bsuir.service.SecurityService;
import by.bsuir.service.UserService;
import by.bsuir.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthenticationController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String hello() {
        return "index";
    }

    @RequestMapping(value = "/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        if (error != null) {
            modelAndView.addObject("error", "Invalid login or password!");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model ) {
        model.addAttribute("user", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute User user, BindingResult bindingResult, Model model) {
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        if (!userService.saveUser(user)) {
            model.addAttribute("error", "This username exists! Try to write another username");
            return "registration";
        }
        securityService.autoLogin(user.getUsername(), user.getPassword());
        return "redirect:/flats";
    }
}
