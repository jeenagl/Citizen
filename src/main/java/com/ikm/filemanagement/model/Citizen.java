package com.ikm.filemanagement.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="citizen")
public class Citizen {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="Id")
    private Integer id;
    @Column(name="name")
    private String name;
    @Column(name="Address")
    private String address;
    @Column(name="PhoneNo")
    private String phoneNo;
    @Column(name="DateOfBirth")
    private Date dateOfBirth;

}

