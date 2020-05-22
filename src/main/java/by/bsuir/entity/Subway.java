package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(exclude = "addresses")
@ToString(exclude = "addresses")
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name="subway", schema = "rent_ap2")
public class Subway {
    @Id
    @Column(name = "id_subway", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @ManyToMany(
            mappedBy = "subways",
            fetch = FetchType.LAZY
    )
    private Set<Address> addresses;
}
