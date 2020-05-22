package by.bsuir.controller;

import by.bsuir.service.FlatService;
import by.bsuir.service.impl.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private FlatService flatService;

    @RequestMapping(value = "/approve/{id}/{status}", method = RequestMethod.GET)
    //TODO исправить какие страницы будут возвращаться в случае успеха или ошибки
    public ModelAndView approveBookFlat(@PathVariable Long id, @PathVariable String status){
        ModelAndView modelAndView = new ModelAndView();
        if (adminService.approveBookFlat(id, status)){
            modelAndView.setViewName("");
            modelAndView.addObject("success", "You approve apartment booking!");
        } else {
            modelAndView.setViewName("");
            modelAndView.addObject("error", "Sorry, something went wrong! Please, try again later.");
        }
        return modelAndView;
    }

    //TODO исправить какие страницы будут возвращаться в случае успеха или ошибки
    @RequestMapping(value = "/decline/{id}/{status}", method = RequestMethod.GET)
    public ModelAndView declineBookFlat(@PathVariable Long id, @PathVariable String status){
        ModelAndView modelAndView = new ModelAndView();
        if (adminService.declineBookFlat(id, status)){
            modelAndView.setViewName("");
            modelAndView.addObject("success", "You decline apartment booking!");
        } else {
            modelAndView.setViewName("");
            modelAndView.addObject("error", "Sorry, something went wrong! Please, try again later.");
        }
        return modelAndView;
    }

    //TODO исправить какие страницы будут возвращаться в случае успеха или ошибки
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showListFlatForApprove(){
        ModelAndView modelAndView = new ModelAndView("");
        List flats = flatService.findAllBYStatus("handle");
        modelAndView.addObject("flats", flats);
        return modelAndView;
    }
}
