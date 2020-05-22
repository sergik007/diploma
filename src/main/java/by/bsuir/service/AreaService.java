package by.bsuir.service;

import by.bsuir.entity.Area;

import java.util.List;

/**
 * Created by Siarhei_Kalashynski on 10/10/2017.
 */
public interface AreaService {

    void saveArea(Area area);

    void deleteArea(Long id);

    Area getArea(Long id);

    void updateArea(Area newArea);

    List<Area> getAreas();
}
