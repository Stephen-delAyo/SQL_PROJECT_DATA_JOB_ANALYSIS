CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT *
FROM job_applied

INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES      (1,
            '2024-02-01',
            true,
            'resume_01.pdf',
            true,
            'cover_letter_01.pdf',
            'submitted'),
            (2,
            '2024-02-02',
            false,
            'resume_02.pdf',
            false,
            NULL,
            'interview_scheduled'),
            (3,
            '2024-02-03',
            true,
            'resume_03.pdf',
            true,
            'cover_letter_03.pdf',
            'ghosted'),
            (4,
            '2024-02-04',
            true,
            'resume_04.pdf',
            false,
            NULL,
            'submitted'),
            (5,
            '2024-02-05',
            false,
            'resume_05.pdf',
            true,
            'cover_letter_05.pdf',
            'rejected');                


-- Adding the contact column to the job_applied table
ALTER TABLE job_applied
ADD contact VARCHAR(50);    

SELECT *
FROM job_applied;

-- Adding records/rows to the newly created column, 'contact'
UPDATE job_applied
SET contact = 'Erling Hoofman'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Chung Tai'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Bertram Jude'
WHERE job_id = 3;

UPDATE job_applied 
SET contact = 'Jang Jang'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'June Berlam'
WHERE job_id = 5;

SELECT *
FROM job_applied;

-- Renaming 'contact' column as 'contact_name'
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

SELECT *
FROM job_applied;

-- I am changing the data type of the 'contact_name' column from VARCHAR to TEXT
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

-- Deleting the 'contact_name' column
ALTER TABLE job_applied
DROP COLUMN contact_name;

-- Delete the table itself using the DROP TABLE syntax
DROP TABLE job_applied;

