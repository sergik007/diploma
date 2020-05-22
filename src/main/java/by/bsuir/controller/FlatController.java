package by.bsuir.controller;

import by.bsuir.entity.Flat;
import by.bsuir.service.FlatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/flats")
public class FlatController {

    @Autowired
    private FlatService flatService;

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView findAllByFilter(@RequestParam int idArea, int priceFrom, int priceTo, int[] amountRoom, int date){
        ModelAndView modelAndView = new ModelAndView("flats");
        List flats = flatService.findAllByFilter(idArea, priceFrom, priceTo, amountRoom, date);
        modelAndView.addObject("flats", flats);
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView findAll() {
        List<Flat> flats = flatService.findAll();
        return new ModelAndView("flats", "flats", flats);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView getFlat(@PathVariable Long id) {
        Flat flat = flatService.getFlat(id);
        if (flat == null) {
            //нужно вернуть сстраницу, что ресурс не найден
        }
        return new ModelAndView("flat", "flat", flat);
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Long saveFlat(@RequestBody Flat flat) {
        Flat result = flatService.saveFlat(flat);
        return result.getId();
    }

    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Long updateFlat(@RequestBody Flat flat) {
        Flat result = flatService.updateFlat(flat);
        return result.getId();
    }

    @ResponseBody
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public void deleteFlat(@PathVariable Long id) {
        flatService.deleteFlat(id);
    }
}
