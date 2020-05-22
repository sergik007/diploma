package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(exclude = {"images", "addresses", "flatStatus", "orders"})
@ToString(exclude = {"images", "addresses", "flatStatus", "orders"})
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "flat", schema = "rent_ap2")
public class Flat {
    @Id
    @Column(name = "id_flat", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "amount_room", nullable = false)
    private Integer amountRoom;

    @Column(name = "average_mark", nullable = false)
    private Float averageMark;

    @Column(name = "month_price", nullable = false)
    private Double monthPrice;

    @Column(name = "upload_date", nullable = false)
    private LocalDate uploadDate;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, targetEntity = Image.class)
    @JoinColumn(name = "id_flat", nullable = false)
    private Set<Image> images;

    @OneToMany(cascade = CascadeType.ALL, targetEntity = Address.class)
    @JoinColumn(name = "id_flat", nullable = false)
    private Set<Address> addresses;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_flat_status", nullable = false)
    private FlatStatus flatStatus;

    @OneToMany(mappedBy = "flat", fetch = FetchType.LAZY)
    private Set<Order> orders;
}