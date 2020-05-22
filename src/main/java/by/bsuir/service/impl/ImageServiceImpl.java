package by.bsuir.service.impl;

import by.bsuir.entity.Image;
import by.bsuir.repository.ImageRepository;
import by.bsuir.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {
    @Autowired
    private ImageRepository imageRepository;

    @Transactional(readOnly = true)
    @Override
    public List<Image> getImages() {
        return imageRepository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Image getImage(Long id) {
        return imageRepository.findOne(id);
    }

    @Override
    public void saveImage(Image country) {
        imageRepository.save(country);
    }

    @Override
    public void updateImage(Image newImage) {
        Image oldImage = imageRepository.getOne(newImage.getId());
        oldImage.setUrl(newImage.getUrl());
    }

    @Override
    public void deleteImage(Long id) {
        imageRepository.delete(id);
    }
}
