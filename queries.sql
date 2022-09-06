-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * 
FROM `students`
WHERE `date_of_birth` LIKE '1990%';

ALTERNATIVA

SELECT *
FROM `students`
WHERE YEAR (`date_of_birth`) = '1990';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses`
WHERE `cfu` > 10


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students`
WHERE YEAR(date_of_birth) <= 1991

ALTERNATIVA

SELECT * 
FROM `students`
WHERE `date_of_birth` < '1992-01-01';

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * FROM `courses`
WHERE `year` = 1 AND `period` = 'I semestre'  



-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del   (21)

SELECT * FROM `exams`
WHERE `date` = '20-06-20' AND `hour`> '14:00:00'


-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale'


-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) as 'Numeri Dipartimenti' 
FROM `departments`

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

  SELECT *
    FROM `teachers`
    WHERE `phone` IS NOT NULL



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno 

SELECT COUNT(*) AS `numero_studenti`, YEAR(`enrolment_date`) AS `anno`
    FROM `students`
    GROUP BY YEAR(`enrolment_date`)


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT('id') AS `numero_insegnanti`, `office_number` AS `numero_ufficcio`
    FROM `teachers`
    GROUP BY (`office_number`)


-- 3. Calcolare la media dei voti di ogni appello d'esame


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento