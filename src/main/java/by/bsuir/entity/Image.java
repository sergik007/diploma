package by.bsuir.entity;

import lombok.*;

import javax.persistence.*;


@Getter
@Setter
@EqualsAndHashCode
@ToString
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "image", schema = "rent_ap2")
public class Image {
    @Id
    @Column(name = "id_image", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "url", nullable = false)
    private String url;
}
