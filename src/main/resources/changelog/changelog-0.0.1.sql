CREATE TABLE enquiry_details
(
    id uuid not null primary key,
    file_no varchar(255),
    office_id BIGINT not null,
    latitude varchar(255),
    longitude varchar(255),
    enquiry_text varchar(255),
    assigner uuid ,
    pen_no varchar(255),
    post_id uuid,
    post_name varchar(255),
    designation varchar(255),
    created_by varchar(255),
    created_at TIMESTAMP,
    updated_by varchar(255),
    updated_at TIMESTAMP
);


CREATE TABLE enquiry_documents
(
    id uuid not null primary key,
    office_id BIGINT not null,
    enquiry_id uuid,
    file_no varchar(255) not null,
    document_name varchar(255),
    file_store_id int,
    uploaded_enquiry_docs_info JSONB,
    created_by varchar(255),
    created_at TIMESTAMP,
    updated_by varchar(255),
    updated_at TIMESTAMP,
    CONSTRAINT fk_enquiry_details FOREIGN KEY (enquiry_id) REFERENCES enquiry_details (id)
);

CREATE TABLE drafts (
    id UUID PRIMARY KEY,
    draft_no INT not null ,
    file_no varchar(255) NOT NULL,
    draft_type INT NOT NULL,
    subject VARCHAR(255),
    reference JSONB,
    draft_text TEXT NOT NULL,
    sender_id INT,
    receiver_id INT,
    address_id UUID,
    draft_stage INT,
    employee_name varchar(255),
    post_id UUID,
    pen_no varchar(255),
    post_name varchar(255),
    designation varchar(255),
    created_by VARCHAR(255),
    created_at TIMESTAMP,
    updated_by VARCHAR(255),
    updated_at TIMESTAMP
);

CREATE TABLE draft_status_log (
    id UUID PRIMARY KEY,
    draft_id UUID    ,
    draft_stage int,
    old_draft JSONB,
    pen_no VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_draft_status_log_file FOREIGN KEY (draft_id) REFERENCES drafts(id)
);

CREATE TABLE draft_address (
    id UUID PRIMARY KEY,
    applicant_address JSONB,
    address_type INT,
    created_by VARCHAR(255),
    created_at TIMESTAMP,
    updated_by VARCHAR(255),
    updated_at TIMESTAMP
);
CREATE TABLE enclosure_documents (
    id BIGSERIAL PRIMARY KEY,
    enclosure_name VARCHAR(255),
    enclosure_files JSONB,
    draft_id UUID,
    created_by VARCHAR(255),
    created_at TIMESTAMP,
    updated_by VARCHAR(255),
    updated_at TIMESTAMP
);
CREATE TABLE file (
  id UUID PRIMARY KEY,
  office_id BIGINT,
  source INT,
  module_code VARCHAR(255),
  submodule_code VARCHAR(255),
  service_code VARCHAR(255),
  sla INT,
  sla_holiday_inclusion BOOLEAN,
  title VARCHAR(255),
  description TEXT,
  file_no varchar(255) unique,
  year INT,
  post_id UUID,
  applicant_name varchar(255),
  mode VARCHAR(255),
  stage VARCHAR(255),
  role VARCHAR(255),
  type VARCHAR(255),
  parent_file_no varchar(255) REFERENCES file(file_no),
  status VARCHAR(255) ,
  route_key1 JSONB,
  route_key2 JSONB,
  created_by VARCHAR(255),
  updated_by VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
  );

ALTER TABLE drafts
    ADD CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file (file_no);

ALTER TABLE enclosure_documents
    ADD CONSTRAINT fk_draft FOREIGN KEY (draft_id) REFERENCES drafts (id);


CREATE TABLE notes_details
(
    id uuid not null primary key,
    office_id BIGINT not null,
    file_no varchar(255),
    notes TEXT NOT NULL,
    assigner uuid ,
    assigner_name varchar(255),
    pen_no varchar(255),
    post_id uuid,
    post_name varchar(255),
    designation varchar(255),
    status varchar(255),
    created_by varchar(255),
    created_at TIMESTAMP,
    updated_by varchar(255),
    updated_at TIMESTAMP

);



CREATE TABLE notes_documents
(
    id uuid not null primary key,
    office_id BIGINT not null,
    notes_id uuid,
    file_no varchar(255) not null,
    document_name varchar(255),
    uploaded_notes_docs_info JSONB,
    created_by varchar(255),
    created_at TIMESTAMP,
    updated_by varchar(255),
    updated_at TIMESTAMP,
    CONSTRAINT fk_notes_details FOREIGN KEY (notes_id) REFERENCES notes_details (id)
);

CREATE TABLE hold_files
(
    id uuid not null primary key,
    file_no varchar(255) not null,
    file_id uuid not null,
    hold_reason varchar(255),
    hold_upto TIMESTAMP,
    un_holded_date TIMESTAMP,
    un_hold_reason varchar(255),
    pen_no varchar(255) ,
    created_by varchar(255),
    created_at TIMESTAMP,
    updated_by varchar(255),
    updated_at TIMESTAMP,
    CONSTRAINT fk_files FOREIGN KEY (file_id) REFERENCES file (id)
);

CREATE TABLE reminder
(
   id UUID PRIMARY KEY,
   file_no varchar(255) not null,
   hold_file_id UUID,
   pen_no varchar(255),
   message varchar(255),
   created_by varchar(255),
   created_at TIMESTAMP,
   updated_by varchar(255),
   updated_at TIMESTAMP,
   CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file(file_no),
   CONSTRAINT fk_hold_files FOREIGN KEY (hold_file_id) REFERENCES hold_files(id)
);

ALTER TABLE enquiry_details
    ADD CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file (file_no);

ALTER TABLE enquiry_documents
    ADD CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file (file_no);

ALTER TABLE notes_details
    ADD CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file (file_no);

ALTER TABLE notes_documents
    ADD CONSTRAINT fk_files FOREIGN KEY (file_no) REFERENCES file (file_no);


CREATE TABLE file_status_log (
    id UUID PRIMARY KEY,
    file_no varchar(255),
    post_id UUID,
    office_id BIGINT,
    status VARCHAR(255),
    created_by VARCHAR(255),
    updated_by VARCHAR(255),
    file_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_file_status_log_file FOREIGN KEY (file_id) REFERENCES file(id)
);

CREATE TABLE role_post_id_history (
    id UUID PRIMARY KEY,
    role varchar(255),
    post_id UUID,
    file_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_file_status_log_file FOREIGN KEY (file_id) REFERENCES file(id)
);

CREATE TABLE cash_declaration (
      id UUID PRIMARY KEY,
      office_id INT,
      pen_no VARCHAR(255),
      date DATE NOT NULL ,
      amount INT,
      created_by VARCHAR(255),
      created_at TIMESTAMP,
      updated_at TIMESTAMP
);
CREATE TABLE cash_declaration_denomination
(
    id                  uuid primary key,
    denomination_Id     int not null,
    count               int not null,
    cash_declaration_id UUID,
     updated_at TIMESTAMP,
    created_at TIMESTAMP,
    CONSTRAINT fk_cash_declaration_denomination FOREIGN KEY (cash_declaration_id) REFERENCES cash_declaration (id)
);

CREATE TABLE pull_file (
     id UUID PRIMARY KEY,
     file_no varchar(255),
     current_user_post_id UUID,
     current_stage VARCHAR(255),
     pull_user_post_id UUID,
     pull_reason VARCHAR(255),
     pull_date DATE,
     created_by VARCHAR(255),
     updated_by VARCHAR(255),
     created_at TIMESTAMP,
     updated_at TIMESTAMP
);

CREATE TABLE sequence (
     id UUID PRIMARY KEY,
    name VARCHAR(255),
    current_value BIGINT
);



CREATE TABLE applicant_details
(
    id                 UUID PRIMARY KEY,
    file_id            UUID REFERENCES file (id),
    application_id     UUID,
    application_number VARCHAR(255),
    applicant_name     VARCHAR(255),
    applicant_address  TEXT,
    institution        VARCHAR(255),
    officer_name       VARCHAR(255),
    designation        VARCHAR(255)
);
CREATE TABLE draft_copy_to
   (
       id BIGSERIAL PRIMARY KEY,
       copy_to_address JSONB,
       created_by VARCHAR(255),
       created_at TIMESTAMP,
       updated_by VARCHAR(255),
       updated_at TIMESTAMP
);

ALTER TABLE drafts ADD COLUMN draft_copy_to_id BIGINT;
ALTER TABLE drafts
        ADD CONSTRAINT fk_draft_copy_to FOREIGN KEY (draft_copy_to_id) REFERENCES draft_copy_to (id);
ALTER TABLE draft_address ADD COLUMN draft_id UUID;

ALTER TABLE draft_address
    ADD CONSTRAINT fk_draft_address FOREIGN KEY (draft_id) REFERENCES drafts (id);

CREATE TABLE file_process
(
    id UUID PRIMARY KEY,
    main_file_id UUID,
    sub_file_id UUID,
    file_type varchar (30),
    created_by VARCHAR(255),
    updated_by VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_file_process FOREIGN KEY (main_file_id) REFERENCES file (id)
);

