package by.bsuir.service.impl;

import by.bsuir.entity.Authority;
import by.bsuir.repository.AuthorityRepository;
import by.bsuir.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuthorityServiceImpl implements AuthorityService {
    @Autowired
    private AuthorityRepository authorityRepository;

    @Transactional(readOnly = true)
    @Override
    public Authority getAuthority(Long id) {
        return authorityRepository.findOne(id);
    }
}
