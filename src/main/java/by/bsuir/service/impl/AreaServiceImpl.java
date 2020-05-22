package by.bsuir.service.impl;

import by.bsuir.entity.Area;
import by.bsuir.repository.AreaRepository;
import by.bsuir.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaRepository areaRepository;

    @Override
    public void saveArea(Area area) {
        areaRepository.save(area);
    }

    @Override
    public void deleteArea(Long id) {
        areaRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Area getArea(Long id) {
        return areaRepository.findOne(id);
    }

    @Override
    public void updateArea(Area newArea) {
        Area oldArea = areaRepository.getOne(newArea.getId());
        oldArea.setName(newArea.getName());
        oldArea.setAddresses(newArea.getAddresses());
    }

    @Transactional(readOnly = true)
    @Override
    public List<Area> getAreas() {
        return areaRepository.findAll();
    }
}