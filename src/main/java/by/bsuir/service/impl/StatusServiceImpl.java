package by.bsuir.service.impl;

import by.bsuir.entity.FlatStatus;
import by.bsuir.repository.StatusRepository;
import by.bsuir.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StatusServiceImpl implements StatusService {
    @Autowired
    private StatusRepository statusRepository;

    @Transactional(readOnly = true)
    @Override
    public FlatStatus getStatus(Long id) {
        return statusRepository.getOne(id);
    }
}
