package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@ToString(exclude = "flats")
@EqualsAndHashCode(exclude = "flats")
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name="flat_status", schema = "rent_ap2")
public class FlatStatus {

    @Id
    @Column(name = "id_flat_status", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "type", nullable = false)
    private String type;

    @OneToMany(mappedBy = "flatStatus", fetch = FetchType.LAZY)
    private Set<Flat> flats;
}
