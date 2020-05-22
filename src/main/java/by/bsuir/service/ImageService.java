package by.bsuir.service;

import by.bsuir.entity.Image;

import java.util.List;

public interface ImageService {
    List<Image> getImages();

    Image getImage(Long id);

    void saveImage(Image country);

    void updateImage(Image country);

    void deleteImage(Long id);

}
