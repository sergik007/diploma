package by.bsuir.service.impl;

import by.bsuir.entity.Flat;
import by.bsuir.repository.FlatRepository;
import by.bsuir.repository.filter.FlatFilter;
import by.bsuir.service.FlatService;
import by.bsuir.service.SecurityService;
import by.bsuir.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class FlatServiceImpl implements FlatService {
    @Autowired
    private FlatRepository flatRepository;
    @Autowired
    private StatusService statusService;

    @Autowired
    private SecurityService securityService;

    @Transactional(readOnly = true)
    @Override
    public List<Flat> findAll() {
        return flatRepository.findAll();
    }

    @Override
    public List<Flat> findAllByFilter(int idArea, int priceFrom, int priceTo, int[] amountRoom, int date) {
        if (0 == idArea && 0 == priceFrom && 0 == priceTo && null == amountRoom && 0 == date) {
            return flatRepository.findAll();
        }
        return flatRepository.findAll(FlatFilter.filterByAllParam(idArea, priceFrom, priceTo, amountRoom, date));
    }

    @Override
    public List findAllBYStatus(String status) {
        if (null != status) {
            return flatRepository.findAll(FlatFilter.filterByStatus(status));
        }
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public Flat getFlat(Long id) {
        Flat flat = flatRepository.findOne(id);
        if (flat != null) {
            flat.setAddresses(flat.getAddresses());
            flat.setImages(flat.getImages());
            //flat.setStatus(flat.getFlatStatus());
        }
        return flat;
    }

    @Override
    public Flat saveFlat(Flat flat) {
        flat.setUploadDate(LocalDate.now());
        //flat.setStatus(statusService.getStatus(1L));
        return flatRepository.save(flat);
    }

    @Override
    public void deleteFlat(Long id) {
        flatRepository.delete(id);
    }

    @Override
    public Flat updateFlat(Flat newFlat) {
        Flat oldFlat = flatRepository.getOne(newFlat.getId());
        oldFlat.setAverageMark(newFlat.getAverageMark());
        oldFlat.setAmountRoom(newFlat.getAmountRoom());
        oldFlat.setMonthPrice(newFlat.getMonthPrice());
        return newFlat;
    }
}
