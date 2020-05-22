package by.bsuir.service;

import by.bsuir.entity.Subway;

import java.util.List;

public interface SubwayService {
    List<Subway> getSubways();

    void getSubway(Long id);

    void saveSubway(Subway subway);

    void deleteSubway(Long id);

    void updateSubway(Subway subway);
}