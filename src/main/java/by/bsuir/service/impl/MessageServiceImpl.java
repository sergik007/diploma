package by.bsuir.service.impl;

import by.bsuir.entity.Message;
import by.bsuir.repository.MessageRepository;
import by.bsuir.service.MessageService;
import by.bsuir.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private SecurityService securityService;

    @Override
    @Transactional(readOnly = true)
    public List<Message> getHistory(String username) {
        String currentUsername = securityService.findLoggedInUsername();
        Integer messageHash = createHash(username, currentUsername);
        return messageRepository.findByHash(messageHash);
    }

    @Override
    @Transactional
    public void saveMessage(Message message) {
        message.setDate(LocalDate.now());
        message.setTime(LocalTime.now());
        String usernameFrom = securityService.findLoggedInUsername();
        message.setUsernameFrom(usernameFrom);
        setMessageHash(message);
        System.out.println("Message is saved: " + message.getContent());
        messageRepository.save(message);
    }

    private void setMessageHash(Message message) {
        Integer hash = createHash(message.getUsernameFrom(), message.getUsernameTo());
        message.setHash(hash);
    }


    private Integer createHash(Object object1, Object object2) {
        Object less;
        Object more;
        if (object1.hashCode() > object2.hashCode()) {
            more = object1;
            less = object2;
        } else {
            more = object2;
            less = object1;
        }
        int hash = 17;
        // For each field multiply the previous hash by a prime and add
        hash = 31 * hash + more.hashCode();
        hash = 31 * hash + less.hashCode();
        return hash;
    }
}
