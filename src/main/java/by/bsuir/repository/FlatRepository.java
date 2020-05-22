package by.bsuir.repository;

import by.bsuir.entity.Flat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FlatRepository extends JpaRepository<Flat, Long>, JpaSpecificationExecutor{

    Flat findById(Long id);

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE flat SET flat.id_status = " +
            "(SELECT status.id_status from status WHERE status.type = :status)," +
            " flat.id_user = :id_user WHERE flat.id_flat =:id_flat", nativeQuery = true)
    void bookFlat(@Param("id_flat") Long idFlat, @Param("id_user") Long idUser, @Param("status") String status);
}
