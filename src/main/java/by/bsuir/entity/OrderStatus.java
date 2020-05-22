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
@Table(name = "order_status", schema = "rent_ap2")
public class OrderStatus {
    @Id
    @Column(name = "id_order_status", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="value", nullable = false)
    private String value;

    @OneToMany(mappedBy = "orderStatus", fetch = FetchType.LAZY)
    private Set<Order> orders;
}
