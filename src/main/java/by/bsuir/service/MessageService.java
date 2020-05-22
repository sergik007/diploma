package by.bsuir.service;

import by.bsuir.entity.Message;

import java.util.List;

public interface MessageService {

    List<Message> getHistory(String username);

    void saveMessage(Message message);
}
