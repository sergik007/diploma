package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@EqualsAndHashCode(exclude = "addresses")
@ToString(exclude = "addresses")
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "area", schema = "rent_ap2")
public class Area {
    @Id
    @Column(name = "id_area", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "area", fetch = FetchType.LAZY)
    private Set<Address> addresses;
}
