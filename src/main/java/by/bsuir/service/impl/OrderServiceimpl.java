package by.bsuir.service.impl;

import by.bsuir.entity.Order;
import by.bsuir.repository.OrderRepository;
import by.bsuir.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceimpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    @Override
    public Order getOrder(Long id) {
        return orderRepository.findOne(id);
    }

    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    //@Override
    public Order updateOrder(Order newOrder) {
        return null;
    }

    @Override
    public void deleteOrder(Long id) {
        orderRepository.delete(id);
    }
}
