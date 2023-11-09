package com.ikm.filemanagement.service;

import com.ikm.filemanagement.Contract.CitizenRequest;

import com.ikm.filemanagement.model.Citizen;

import com.ikm.filemanagement.repository.CitizenRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CitizenService {
    public CitizenService(CitizenRepository citizenRepository, ModelMapper modelMapper) {
        this.citizenRepository = citizenRepository;
        this.modelMapper = modelMapper;
    }

    @Autowired
    private final CitizenRepository citizenRepository;
    @Autowired
    private final ModelMapper modelMapper;

    public Integer  saveCitizen(CitizenRequest request){
        Citizen citizen=modelMapper.map(request, Citizen.class);
        Citizen citizen1=citizenRepository.save(citizen);
        return citizen1.getId();
    }

}
