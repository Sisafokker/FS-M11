USE `dev_university` ;

CREATE TABLE `dev_university`.`students` (
  `students_id` INT NOT NULL AUTO_INCREMENT,
  `students_firstName` VARCHAR(40) NOT NULL,
  `students_lastName` VARCHAR(40) NOT NULL,
  `students_email` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE INDEX `students_id_UNIQUE` (`students_id` ASC) VISIBLE,
  UNIQUE INDEX `students_email_UNIQUE` (`students_email` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE `dev_university`.`professors` (
  `professors_id` INT NOT NULL AUTO_INCREMENT,
  `professors_firstName` VARCHAR(40) NOT NULL,
  `professors_lastName` VARCHAR(40) NOT NULL,
  `professors_email` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`professors_id`),
  UNIQUE INDEX `professors_id_UNIQUE` (`professors_id` ASC) VISIBLE,
  UNIQUE INDEX `professors_email_UNIQUE` (`professors_email` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE `dev_university`.`courses` (
  `courses_id` INT NOT NULL AUTO_INCREMENT,
  `courses_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE INDEX `courses_id_UNIQUE` (`courses_id` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE `dev_university`.`grades` (
  `grades_id` INT NOT NULL AUTO_INCREMENT,
  `grades_score` DECIMAL(5,2) NOT NULL,
  `grades_student_id`  INT NOT NULL,
  `grades_course_id`  INT NOT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE INDEX `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
 CONSTRAINT `grades_student_id`
    FOREIGN KEY (`grades_student_id`)
    REFERENCES `dev_university`.`students` (`students_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
 CONSTRAINT `grades_course_id`
    FOREIGN KEY (`grades_course_id`)
    REFERENCES `dev_university`.`courses` (`courses_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE `dev_university`.`enrolstudent` (
  `enrolstudent_id` INT NOT NULL AUTO_INCREMENT,
  `enrolstudent_students_id` INT NOT NULL,
  `enrolstudent_courses_id` INT NOT NULL,
  PRIMARY KEY (`enrolstudent_id`),
  UNIQUE INDEX `enrolstudent_id_UNIQUE` (`enrolstudent_id` ASC) VISIBLE,
 CONSTRAINT `enrolstudent_courses_id`
    FOREIGN KEY (`enrolstudent_courses_id`)
    REFERENCES `dev_university`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
 CONSTRAINT `enrolstudent_students_id`
    FOREIGN KEY (`enrolstudent_students_id`)
    REFERENCES `dev_university`.`students` (`students_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

CREATE TABLE `dev_university`.`enrolprofessor` (
  `enrolprofessor_id` INT NOT NULL AUTO_INCREMENT,
  `enrolprofessor_courses_id` INT NOT NULL,
  `enrolprofessor_professors_id` INT NOT NULL,
  PRIMARY KEY (`enrolprofessor_id`),
  UNIQUE INDEX `enrolprofessor_id_UNIQUE` (`enrolprofessor_id` ASC) VISIBLE,
 CONSTRAINT `enrolprofessor_courses_id`
    FOREIGN KEY (`enrolprofessor_courses_id`)
    REFERENCES `dev_university`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
 CONSTRAINT `enrolprofessor_professors_id`
    FOREIGN KEY (`enrolprofessor_professors_id`)
    REFERENCES `dev_university`.`professors` (`professors_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

