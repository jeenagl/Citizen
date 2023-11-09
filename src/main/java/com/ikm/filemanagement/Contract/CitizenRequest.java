package com.ikm.filemanagement.Contract;


import jakarta.persistence.Column;
import lombok.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CitizenRequest {
    @NotEmpty(message = "Name cannot be empty")
    private String name;
    @NotEmpty(message = "Address cannot be empty")
    private String address;
    private String phoneNo;
    @Past(message = "Date of birth should be a past date")
    private Date dateOfBirth;
}
