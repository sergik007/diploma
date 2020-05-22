package by.bsuir.entity;

import by.bsuir.util.JsonDateDeserializer;
import by.bsuir.util.JsonDateSerializer;
import by.bsuir.util.JsonTimeDeserializer;
import by.bsuir.util.JsonTimeSerializer;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;


@Setter
@Getter
@EqualsAndHashCode
@ToString
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "message", schema = "rent_ap2", indexes = { @Index(name="hashIndex",columnList = "hash")})
public class Message {
    @Id
    @Column(name = "id", nullable = false, columnDefinition = "BIGINT(20) UNSIGNED")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="content", nullable = false)
    private String content;

    @JsonIgnore

    @Column(name = "hash", nullable = false)
    private Integer hash;

    @Column(name = "usernameTo" , nullable = false)
    private String usernameTo;

    @Column(name="usernameFrom" , nullable = false)
    private String usernameFrom;

    @JsonDeserialize(using = JsonDateDeserializer.class)
    @JsonSerialize(using = JsonDateSerializer.class)

    @Column(name = "date" , nullable = false)
    private LocalDate date;

    @JsonDeserialize(using = JsonTimeDeserializer.class)
    @JsonSerialize(using = JsonTimeSerializer.class)

    @Column(name = "time" , nullable = false)
    private LocalTime time;
}