package by.bsuir.repository;

import by.bsuir.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    @Modifying(clearAutomatically = true)
    @Query(value = "update User u set u.enabled = :flag where u.id_user = :id", nativeQuery = true)
    void changeEnable(@Param(value = "id") Long id, @Param(value = "flag") boolean flag);
}
