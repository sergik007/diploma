package by.bsuir.service.impl;

import by.bsuir.entity.Address;
import by.bsuir.repository.AddressRepository;
import by.bsuir.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressRepository addressRepository;

    @Override
    public void saveAddress(Address city) {
        addressRepository.save(city);
    }

    @Override
    public void deleteAddress(Address city) {
        addressRepository.delete(city);
    }

    @Override
    public Address getAddress(Long id) {
        return addressRepository.findOne(id);
    }

    @Override
    public void updateAddress(Address newAddress) {
        Address oldAddress = addressRepository.getOne(newAddress.getId());
        oldAddress.setFlatNumber(newAddress.getFlatNumber());
        oldAddress.setHouseNumber(newAddress.getHouseNumber());
        oldAddress.setStreet(newAddress.getStreet());
    }

    @Transactional(readOnly = true)
    @Override
    public List<Address> getAddresses() {
        return addressRepository.findAll();
    }
}
