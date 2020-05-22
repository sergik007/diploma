package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;


@Setter
@Getter
@ToString(exclude = {"area", "subways"})
@EqualsAndHashCode(exclude = {"area", "subways"})
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "address", schema = "rent_ap2")
public class Address {
    @Id
    @Column(name = "id_address", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "street", nullable = false)
    private String street;

    @Column(name = "house_number", nullable = false)
    private Integer houseNumber;

    @Column(name = "flat_number", nullable = true)
    private Integer flatNumber;

    @ManyToOne
    @JoinColumn(
            name = "id_area",
            nullable = false,
            foreignKey = @ForeignKey(name="area_has_address")
    )
    private Area area;

    @ManyToMany(
            fetch = FetchType.LAZY,
            cascade = {CascadeType.ALL}
    )
    @JoinTable(
            name = "subway_address",
            joinColumns = @JoinColumn(name = "id_address"),
            inverseJoinColumns = @JoinColumn(name = "id_subway"),
            foreignKey = @ForeignKey(name = "fk_address_has_subway"),
            inverseForeignKey = @ForeignKey(name = "fk_subway_has_address")
    )
    public Set<Subway> subways;
}
