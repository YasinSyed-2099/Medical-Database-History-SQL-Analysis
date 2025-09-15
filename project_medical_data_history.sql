# 1.Show first name, last name, and gender of patients who's gender is 'M'.
# 2.Show first name and last name of patients who does not have allergies.
# 3.Show first name of patients that start with the letter 'C'
# 4.Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
# 5.Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
# 6.Show first name and last name concatenated into one column to show their full name.
# 7.Show first name, last name, and the full province name of each patient
# 8.Show how many patients have a birth_date with 2010 as the birth year.
# 9. Show the first_name, last_name, and height of the patient with the greatest height.
# 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
# 11. Show the total number of admissions 
# 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
# 13. Show the total number of admissions for patient_id 579.
# 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
# 15.Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70.
# 16. Show unique birth years from patients and order them by ascending
# 17. Show unique first names from the patients table which only occurs once in the list. For example, if two or more people are named 'John' in the first_name column  then don't include their name in the output list.If only 1 person is named 'Leo' then include them in the output. */
# 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is 6 characters long.
# 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
# 20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
# 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row
# 22. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis
# 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
# 25. Show first name, last name and role of every person that is either patient or doctor.    The roles are either "Patient" or "Doctor"
# 26. Show all allergies ordered by popularity. Remove NULL values from query.
# 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
# 28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane
# 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
# 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
# 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
# 32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
# 33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). Weight is in units kg. Height is in units cm. 
# 34. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. Check patients, admissions, and doctors tables for required information.


-- Use the medical database
USE project_medical_data_history;

-- Preview first 5 rows of each table
SELECT * FROM admissions LIMIT 5;
SELECT * FROM doctors LIMIT 5;
SELECT * FROM patients LIMIT 5;
SELECT * FROM province_names LIMIT 5;

-- Count rows in each table
SELECT COUNT(*) AS total_admissions FROM admissions;
SELECT COUNT(*) AS total_doctors FROM doctors;
SELECT COUNT(*) AS total_patients FROM patients;
SELECT COUNT(*) AS total_provinces FROM province_names;


# 1. Show first name, last name, and gender of patients who's gender is 'M'
SELECT
	first_name,
    last_name,
    gender
FROM patients
WHERE gender = 'M'
LIMIT 100
;

#2. Show first name and last name of patients who does not have allergies.
SELECT 
	first_name,
    last_name,
    allergies
FROM patients
WHERE allergies IS NULL
LIMIT 100;

# 3. Show first name of patients that start with the letter 'C'
SELECT
	first_name
FROM patients
WHERE first_name LIKE 'C%'
;

#4.Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
SELECT
	first_name,
    last_name,
    weight
FROM patients
WHERE weight BETWEEN 100 AND 120
;

#5.Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL
;

# 6.Show first name and last name concatenated into one column to show their full name.
SELECT
	first_name,
    last_name,
    CONCAT(first_name,'  ', last_name) AS Full_name
FROM patients
LIMIT 100;

#7.Show first name, last name, and the full province name of each patient
SELECT 
	patients.first_name,
	patients.last_name,
	province_names.province_name
FROM patients 
INNER JOIN province_names
ON patients.province_id = province_names.province_id
ORDER BY province_name
LIMIT 100;

# 8.Show how many patients have a birth_date with 2010 as the birth year.
SELECT 
	COUNT(birth_date)
FROM patients
WHERE birth_date BETWEEN  '2010-01-01' 
				 AND '2010-12-31'
LIMIT 100;

# 9. Show the first_name, last_name, and height of the patient with the greatest height.
SELECT 
	first_name,
	last_name,
	height
FROM patients
ORDER BY height DESC
LIMIT 1
;

# 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
SELECT * 
FROM patients
WHERE patient_id IN (1,45,534,879,1000)
;

# 11. Show the total number of admissions 
SELECT 
	COUNT(patient_id) AS Total_Admissions
FROM admissions
LIMIT 100;

# 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
SELECT * 
FROM admissions
WHERE admission_date = discharge_date
LIMIT 100;

#13. Show the total number of admissions for patient_id 579.
SELECT 
	COUNT(patient_id) AS Total_admissions
FROM admissions
WHERE patient_id = 579
;


-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT DISTINCT city
FROM patients 
WHERE province_id = 'NS'
;


/*15.Write a query to find the first_name, last name and birth date of patients 
	who have height more than 160 and weight more than 70.*/
SELECT 
	first_name,
	last_name,
	birth_date,
	height,
    weight
FROM patients
WHERE Height > 160 
AND weight > 70
;
    
-- 16. Show unique birth years from patients and order them by ascending.
SELECT 
	DISTINCT YEAR(birth_date) AS Unique_birth_years
FROM patients
ORDER BY Unique_birth_years ASC
;

#17. Show unique first names from the patients table which only occurs once in the list.
/*For example, if two or more people are named 'John' in the first_name column 
  then don't include their name in the output list.
  If only 1 person is named 'Leo' then include them in the output. 
*/
SELECT 
	first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1 
;

/* 18. Show patient_id and first_name from patients where their first_name start 
        and ends with 's' and is 6 characters long. */
SELECT 
	patient_id,
	first_name
FROM patients
WHERE LOWER(first_name) LIKE 's____s'
; 

/*  19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
    Primary diagnosis is stored in the admissions table. */
SELECT 
	pa.first_name,
	pa.last_name,
	ad.diagnosis,
	ad.patient_id
FROM patients AS pa
JOIN admissions AS ad
ON pa.patient_id = ad.patient_id
WHERE ad.diagnosis = 'Dementia'
ORDER BY pa.first_name
;

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
SELECT 
	DISTINCT first_name,
    length(first_name) AS Length_names
FROM patients
ORDER BY Length_names DESC,
		 first_name
;

-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. 
-- Display the two results in the same row.
SELECT 
    SUM(CASE
        WHEN gender = 'M' THEN 1
        ELSE 0
    END) AS total_male,
    SUM(CASE
        WHEN gender = 'F' THEN 1
        ELSE 0
    END) AS total_female
FROM
    patients;

/*22. Show patient_id, diagnosis from admissions.
 Find patients admitted multiple times for the same diagnosis*/
 
SELECT 
	patient_id,
	diagnosis
FROM admissions
GROUP BY patient_id,
			diagnosis
HAVING COUNT(*) > 1
;

/*24. Show the city and the total number of patients in the city.
		Order from most to least patients and then by city name ascending.*/

SELECT 
	city,
	COUNT(patient_id) AS Total_patients
FROM patients
GROUP BY city
ORDER BY Total_patients DESC,
			city ASC
;

/*25. Show first name, last name and role of every person that is either patient or doctor.
        The roles are either "Patient" or "Doctor"*/
        
SELECT first_name,last_name, 'doctor' AS role
FROM doctors
UNION
SELECT first_name,last_name,'patient' AS role 
FROM patients
;

/*26. Show all allergies ordered by popularity. Remove NULL values from query*/

SELECT
	allergies,
	COUNT(allergies) AS popularity
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY popularity DESC
;


-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

SELECT 
	first_name,
	last_name,
	birth_date
FROM patients 
WHERE YEAR(birth_date) BETWEEN '1970' 
						AND '1979' 
ORDER BY birth_date 
;

/*28. We want to display each patient's full name in a single column. 
Their last_name in all upper letters must appear first, then first_name in all lower case letters.
Separate the last_name and first_name with a comma.
Order the list by the first_name in decending order   
EX: SMITH,jane*/
SELECT 
	first_name,
	last_name,
	CONCAT(first_name,' ',last_name) AS Full_name,
	CONCAT(UPPER(last_name),',', LOWER(first_name) ) AS CommoSeperated
FROM patients
ORDER BY first_name DESC
limit 100;

/*29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.*/
SELECT 
	province_id,
	SUM(height) AS Total_height
FROM patients 
GROUP BY province_id
HAVING Total_height >= 7000 
ORDER BY Total_height DESC
;

-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT 
	last_name,
	MAX(weight) AS largest_weight,
	MIN(weight) AS Smallest_weight,
	MAX(weight) - MIN(weight) AS weight_difference
From patients 
WHERE LOWER(last_name) = 'maroni'
;



-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day.
-- Sort by the day with most admissions to least admissions.
SELECT 
	DAY(admission_date) AS Admission_days,
	COUNT(admission_date) AS no_of_days
FROM admissions
GROUP BY admission_days
ORDER BY no_of_days DESC 
;

/*32. Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.
e.G. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.*/

SELECT
CASE 
		WHEN weight BETWEEN 1  AND 10 THEN '10  weight group'
        WHEN weight BETWEEN 11 AND 20 THEN '20  weight group' 
		WHEN weight BETWEEN 21 AND 30 THEN '30  weight group'
        WHEN weight BETWEEN 31 AND 40 THEN '40  weight group'
        WHEN weight BETWEEN 41 AND 50 THEN '50  weight group'
        WHEN weight BETWEEN 51 AND 60 THEN '60 weight group'
        WHEN weight BETWEEN 61 AND 70 THEN '70 weight group'
        WHEN weight BETWEEN 71 AND 80 THEN '80 weight group'
        WHEN weight BETWEEN 81 AND 90 THEN '90 weight group'
        WHEN weight BETWEEN 91 AND 100  THEN '100 weight group'
        WHEN weight BETWEEN 101 AND 110 THEN '110 weight group'
        WHEN weight BETWEEN 111 AND 120 THEN '120 weight group'
        WHEN weight BETWEEN 121 AND 130 THEN '130 weight group'
        WHEN weight >= 131  THEN '131+ weight group'
END 	AS weight_groups,
COUNT(weight) AS patients_count
FROM patients
GROUP BY weight_groups
ORDER BY MIN(weight) DESC
;

/*
33. Show patient_id, weight, height, is Obese from the patients table.
Display is Obese as a boolean 0 or 1.
Obese is defined as weight(kg)/(height(m).
Weight is in units kg. Height is in units cm.
*/

SELECT 
    patient_id,
    weight,
    height,
    CASE 
        WHEN weight / POWER(height/100, 2) >= 30 THEN 1
        ELSE 0
    END AS is_obese
FROM patients;


/*34. Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'.
Check patients, admissions, and doctors tables for required information.*/

SELECT 
	p.first_name,
	p.last_name,
	a.diagnosis,
	d.first_name,
	d.specialty
FROM admissions AS a
INNER JOIN patients AS p
ON a.patient_id = p.patient_id
INNER JOIN doctors AS d 
ON a.attending_doctor_id = d.doctor_id
WHERE diagnosis = 'Epilepsy'
AND d.first_name = 'Lisa' 
;
