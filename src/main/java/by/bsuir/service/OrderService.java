package by.bsuir.service;

import by.bsuir.entity.Order;

import java.util.List;

public interface OrderService {
    void saveOrder(Order order);

    Order getOrder(Long id);

    List<Order> findAll();

    //Order updateOrder(Order newOrder);

    void deleteOrder(Long id);
}
