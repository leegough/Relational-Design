-- Table structure for table `building`
--

CREATE TABLE IF NOT EXISTS `building` (
  `building_id` int(30) NOT NULL AUTO_INCREMENT,
  `street_name` varchar(30) NOT NULL,
  `street_no` int(30) NOT NULL,
  `post_code` varchar(30) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- Table structure for table `apartment`
--

CREATE TABLE IF NOT EXISTS `apartment` (
  `building_id` int(30) NOT NULL,
  `apart_no` int(30) NOT NULL,
  `bedroom_no` int(30) NOT NULL,
  `bathroom_no` int(30) NOT NULL,
  `area_sq_feet` int(30) NOT NULL,
  PRIMARY KEY (`apart_no`,`building_id`),
  KEY `building_id` (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `apartment`
--
ALTER TABLE `apartment`
  ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE;


-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(30) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- Table structure for table `person_number`
--

CREATE TABLE IF NOT EXISTS `person_number` (
  `person_id` int(30) NOT NULL,
  `number` varchar(30) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Constraints for table `person_number`
--
ALTER TABLE `person_number`
  ADD CONSTRAINT `person_number_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE;



-- Table structure for table `lease_agreement`
--

CREATE TABLE IF NOT EXISTS `lease_agreement` (
  `lease_id` int(30) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `monthly_duration` int(30) NOT NULL,
  `monthly_rent` int(30) NOT NULL,
  PRIMARY KEY (`lease_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1121 ;

-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `person_id` int(30) NOT NULL,
  `monthly_salary` int(30) NOT NULL,
  PRIMARY KEY (`person_id`,`monthly_salary`),
  KEY `person_id` (`person_id`),
  KEY `person_id_2` (`person_id`),
  KEY `monthly_salary` (`monthly_salary`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE;


-- Table structure for table `tenant`
--

CREATE TABLE IF NOT EXISTS `tenant` (
  `person_id` int(30) NOT NULL,
  `account_no` int(30) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `tenant`
--
ALTER TABLE `tenant`
  ADD CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE;
  
-- Table structure for table `technician`
--

CREATE TABLE IF NOT EXISTS `technician` (
  `tech_id` int(30) NOT NULL AUTO_INCREMENT,
  `monthly_salary` int(30) NOT NULL,
  PRIMARY KEY (`tech_id`),
  KEY `monthly_salary` (`monthly_salary`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- Constraints for table `technician`
--
ALTER TABLE `technician`
  ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`monthly_salary`) REFERENCES `employee` (`monthly_salary`) ON DELETE CASCADE;


-- Table structure for table `tech_skills`
--

CREATE TABLE IF NOT EXISTS `tech_skills` (
  `tech_id` int(30) NOT NULL,
  `skills` varchar(100) NOT NULL,
  PRIMARY KEY (`tech_id`),
  KEY `tech_id` (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `tech_skills`
--
ALTER TABLE `tech_skills`
  ADD CONSTRAINT `tech_skills_ibfk_1` FOREIGN KEY (`tech_id`) REFERENCES `technician` (`tech_id`) ON DELETE CASCADE;


-- Table structure for table `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` int(30) NOT NULL AUTO_INCREMENT,
  `monthly_salary` int(30) NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `monthly_salary` (`monthly_salary`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`monthly_salary`) REFERENCES `employee` (`monthly_salary`) ON DELETE CASCADE;

-- Table structure for table `manages`
--

CREATE TABLE IF NOT EXISTS `manages` (
  `manager_id` int(30) NOT NULL,
  `apart_no` int(30) NOT NULL,
  `guest` int(30) NOT NULL,
  PRIMARY KEY (`manager_id`,`apart_no`),
  KEY `apart_no` (`apart_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `manages`
--
ALTER TABLE `manages`
  ADD CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`apart_no`) REFERENCES `apartment` (`apart_no`) ON DELETE CASCADE;

-- Table structure for table `has_office`
--

CREATE TABLE IF NOT EXISTS `has_office` (
  `manager_id` int(30) NOT NULL,
  `apart_no` int(30) NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `manager_id` (`manager_id`),
  KEY `apart_no` (`apart_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `has_office`
--
ALTER TABLE `has_office`
  ADD CONSTRAINT `has_office_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `has_office_ibfk_2` FOREIGN KEY (`apart_no`) REFERENCES `apartment` (`apart_no`) ON DELETE CASCADE;

-- Table structure for table `m_sign`
--

CREATE TABLE IF NOT EXISTS `m_sign` (
  `manager_id` int(30) NOT NULL,
  `lease_id` int(30) NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `lease_id` (`lease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `m_sign`
--
ALTER TABLE `m_sign`
  ADD CONSTRAINT `m_sign_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `m_sign_ibfk_2` FOREIGN KEY (`lease_id`) REFERENCES `lease_agreement` (`lease_id`) ON DELETE CASCADE;

-- Table structure for table `t_sign`
--

CREATE TABLE IF NOT EXISTS `t_sign` (
  `person_id` int(30) NOT NULL,
  `lease_id` int(30) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `lease_id` (`lease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `t_sign`
--
ALTER TABLE `t_sign`
  ADD CONSTRAINT `t_sign_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `tenant` (`person_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `t_sign_ibfk_2` FOREIGN KEY (`lease_id`) REFERENCES `lease_agreement` (`lease_id`) ON DELETE CASCADE;


-- Table structure for table `for`
--

CREATE TABLE IF NOT EXISTS `for` (
  `lease_id` int(30) NOT NULL,
  `apart_no` int(30) NOT NULL,
  PRIMARY KEY (`lease_id`),
  KEY `apart_no` (`apart_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `for`
--
ALTER TABLE `for`
  ADD CONSTRAINT `for_ibfk_1` FOREIGN KEY (`lease_id`) REFERENCES `lease_agreement` (`lease_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `for_ibfk_2` FOREIGN KEY (`apart_no`) REFERENCES `apartment` (`apart_no`) ON DELETE CASCADE;