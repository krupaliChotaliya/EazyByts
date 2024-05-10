package com.blog.app.Model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.bind.DefaultValue;

import java.util.List;

@Entity
@EntityScan
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    @Column
    private String email;
    @Column
    private String password;
    @Column
    private String username;
    @Column
    private String role;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Blog> blogs;
}
