package by.bsuir.service;

import by.bsuir.entity.Address;

import java.util.List;

/**
 * Created by Siarhei_Kalashynski on 10/10/2017.
 */
public interface AddressService {

    void saveAddress(Address city);

    void deleteAddress(Address city);

    Address getAddress(Long id);

    void updateAddress(Address newCity);

    List<Address> getAddresses();
}
