package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@EqualsAndHashCode(exclude = {"orders"})
@ToString(exclude = {"orders"})
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order_type", schema = "rent_ap2")
public class OrderType {
    @Id
    @Column(name = "id_order_type", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="value", nullable = false)
    private String value;

    @OneToMany(mappedBy = "orderType", fetch = FetchType.LAZY)
    private Set<Order> orders;
}
