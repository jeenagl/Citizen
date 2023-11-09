package com.ikm.filemanagement.controller;

import com.ikm.filemanagement.Contract.CitizenRequest;
import com.ikm.filemanagement.Contract.Response;
import com.ikm.filemanagement.service.CitizenService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CitizenController {
    @Autowired
    private CitizenService citizenService;
    @PostMapping("/employee")
    public ResponseEntity<Response<Integer>> createCitizen(@RequestBody CitizenRequest request) {
        Integer CitizenId =citizenService.saveCitizen(request);

        Response<Integer> response = Response.<Integer>builder()
                .payload(CitizenId)
                .message("Citizen created successfully")
                .build();

        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }
}

