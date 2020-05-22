package by.bsuir.service.impl;

import by.bsuir.entity.Subway;
import by.bsuir.repository.SubwayRepository;
import by.bsuir.service.SubwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SubwayServiceImpl implements SubwayService {

    @Autowired
    private SubwayRepository subwayRepository;

    @Transactional(readOnly = true)
    @Override
    public List<Subway> getSubways() {
        return subwayRepository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public void getSubway(Long id) {
        subwayRepository.findOne(id);
    }

    @Override
    public void saveSubway(Subway subway) {
        subwayRepository.save(subway);
    }

    @Override
    public void deleteSubway(Long id) {
        subwayRepository.delete(id);
    }

    @Override
    public void updateSubway(Subway newSubway) {
        Subway oldSubway = subwayRepository.findOne(newSubway.getId());
        oldSubway.setName(newSubway.getName());
        oldSubway.setAddresses(newSubway.getAddresses());
    }
}
