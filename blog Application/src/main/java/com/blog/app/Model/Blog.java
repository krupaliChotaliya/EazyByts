package com.blog.app.Model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.bind.DefaultValue;

import java.util.Date;

@Entity
@EntityScan
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="blog")
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String content;
    private Date createdAt = new Date();;
    private Date updatedAt = new Date();;
    private String image;
    @ManyToOne
    private User user;
    @ManyToOne
    private Category categoryId;

}
