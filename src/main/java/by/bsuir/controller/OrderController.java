package by.bsuir.controller;

import by.bsuir.entity.Order;
import by.bsuir.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
    private OrderService orderService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView findAll() {
        List<Order> orders = orderService.findAll();
        return new ModelAndView("orders", "orders", orders);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView getFlat(@PathVariable Long id) {
        Order order = orderService.getOrder(id);
        if (order == null) {
            //нужно вернуть сстраницу, что ресурс не найден
        }
        return new ModelAndView("order", "order", order);
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void saveFlat(@RequestBody Order order) {
        orderService.saveOrder(order);
        //return result.getId();
    }

    /*@ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Long updateFlat(@RequestBody Flat flat) {
        Flat result = orderService.(flat);
        return result.getId();
    }*/

    @ResponseBody
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public void deleteFlat(@PathVariable Long id) {
        orderService.deleteOrder(id);
    }
}
