package by.bsuir.controller;

import by.bsuir.entity.Message;
import by.bsuir.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping(value ="/chat")
public class ChatController {

    @Autowired
    private MessageService messageService;

    @MessageMapping("/saveMessage")
    @SendTo("/chat/returnMessage")
    public Message saveMessage(Message message) throws Exception {
        Thread.sleep(1000); // simulated delay
        messageService.saveMessage(message);
        return message;
    }
    @RequestMapping(value = "/getHistory/{username}", method = RequestMethod.GET)
    public List<Message> getHistory(@PathVariable String username) {
        List<Message> messages = messageService.getHistory(username);
        return messages;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView getHistory() {
        return new ModelAndView("chat");
    }
}