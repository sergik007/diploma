package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@ToString(exclude = "users")
@EqualsAndHashCode(exclude = "users")
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "authority", schema = "rent_ap2")
public class Authority {
    @Id
    @Column(name = "id_authority", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "authority", nullable = false)
    private String authority;

    @ManyToMany(
            mappedBy = "authorities",
            fetch = FetchType.LAZY
    )
    private Set<User> users;
}
