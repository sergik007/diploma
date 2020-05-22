package by.bsuir.repository;

import by.bsuir.entity.FlatStatus;
import by.bsuir.entity.FlatStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatusRepository extends JpaRepository<FlatStatus, Long> {
    FlatStatus findByType(String type);
}
