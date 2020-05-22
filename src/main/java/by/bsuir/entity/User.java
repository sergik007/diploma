package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Setter
@Getter
@EqualsAndHashCode(exclude = {"authorities", "orders"})
@ToString(exclude = {"authorities", "orders"})
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user", schema = "rent_ap2")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "enabled", nullable = false, columnDefinition = "TINYINT(1)")
    private Boolean enabled;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "surname", nullable = false)
    private String surname;

    @ManyToMany(
            fetch = FetchType.LAZY,
            cascade = {CascadeType.ALL}
    )
    @JoinTable(
            name = "user_authority",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_authority"),
            foreignKey = @ForeignKey(name = "fk_user_has_authority"),
            inverseForeignKey = @ForeignKey(name = "fk_authority_has_user")
    )
    private Set<Authority> authorities;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<Order> orders;

    @Transient
    private String confirmPassword;
}