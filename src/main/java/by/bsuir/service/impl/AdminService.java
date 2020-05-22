package by.bsuir.service.impl;

import by.bsuir.entity.Flat;
import by.bsuir.repository.FlatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("adminService")
@Transactional
public class AdminService extends UserServiceImpl {

    @Autowired
    private FlatRepository flatRepository;

    public boolean approveBookFlat(Long idFlat, String status){
        if (null != idFlat && null != status) {
            Flat flat = flatRepository.findById(idFlat);
            //flatRepository.bookFlat(idFlat, flat.getUser().getId(), status);
            return true;
        }
        return false;
    }

    public boolean declineBookFlat(Long idFlat, String status) {
        if (null != idFlat && null != status) {
            flatRepository.bookFlat(idFlat, null, status);
            return true;
        }
        return false;
    }

}
