package by.bsuir.service;

import by.bsuir.entity.Flat;

import java.util.List;

public interface FlatService {
    List<Flat> findAll();

    List findAllByFilter(int idArea, int priceFrom, int priceTo, int[] amountRoom, int date);

    List findAllBYStatus(String status);

    Flat getFlat(Long id);

    Flat saveFlat(Flat flat);

    void deleteFlat(Long id);

    Flat updateFlat(Flat flat);
}
